declare const EID: ExternalItemDescriptions;
declare class ExternalItemDescriptions {
  addCollectible(
    id: number,
    description: string,
    itemName: string | undefined,
    language: string | undefined,
  ): void;
  addTrinket(
    id: number,
    description: string,
    itemName: string | undefined,
    language: string | undefined,
  ): void;
  addCard(
    id: number,
    description: string,
    itemName: string | undefined,
    language: string | undefined,
  ): void;

  addPill(
    id: number,
    description: string,
    itemName: string | undefined,
    language: string | undefined,
  ): void;
  addEntity(
    id: number,
    variant: number,
    subtype: number,
    entityName: string,
    description: string,
    language: string | undefined,
  ): void;
  addBirthright(
    characterId: number,
    description: string,
    playerName: string,
    language: string | undefined,
  ): void;
}
