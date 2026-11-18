Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515E4606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Reb4D0cA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=qfJzkU1s;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Onz2ct1G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lMVQjeKQ9bRXwISAbOa96WL2GRqMoIe/fG68QfRdzUA=; b=Reb4D0cAl+CDhn
	lRQcI/gmukIXb+dceMJFGIBphL+8uR+Zbo7Pqr4GjEo6UGr2Kug3Cu0D+pM5EFI51tAxJrokFvQCx
	qQG7CH8xt1g9aMWnjBueSrFS0mLVopin/sKaTrY2iaCWSFiiEiUN9upw7tvYuOYFYd0hZbwoADunn
	6qpCaVyqhleg8QNOpYbfPvau8WjNGnrTpV42KfM0mINrd2wF0jp1HWbetAXTAki1SdTzYwkpTX5dq
	EcnL3dXmp3uoLWiBtU/TV8p/5Aemm2Lb0dS1x+S+zMjZ+E7RiALtyMJ+98urcs24ad5E0JPWpl4cb
	WsSZxt7fJkJCDbzR0YZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThT0-00000009FhT-26JB;
	Wed, 18 Nov 2026 15:20:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThSW-00000009FNw-0XwB
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 15:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=lMVQjeKQ9bRXwISAbOa96WL2GRqMoIe/fG68QfRdzUA=; b=qfJzkU1s4qisKRtwGBHfjnrEkE
	oWFe26OVzVzI6Jxn/7rJUZT1V8aCEoOVOlGq5itvMM7YWPMQ5++rEY2Vett6CInFSj1XG29eaXALv
	mpHo2jCwI8inJVtPcje6s9uZ8VSBzyG9+n5q3XgHiGp2nIqYfeqeoyxPy4tfSJfybQSR4k+njPjQd
	PeS3KVJhfpz0EyL7lUjYJySCwtf8IUm0gabqObWOVeWV5q3n/wkM3hq3EfLpPhxZtVvuA78J78q0q
	oCJdEDbB1/w9G4Wowkd8Aovgu+n5vHZqiaZK43FXdP7lO/ZoRU7awQpaMRgQWdGof5LP8eS4M0G7f
	SJFkKqaA==;
Received: from out-84.mta1.migadu.com ([95.215.58.84] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThSR-0000000GCHb-3n4u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:20:26 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=y9RXP5JPR11VVnwMskcq91xFR45jFwuBgc/Y11sK0zA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795015222; v=1; x=1795620022;
 b=Onz2ct1G4qhTAit6a/SB2IgGIjCBE6c5KFRE04LL3Qx9n8tYsO1mGmXTVeaHyJf/r4WAbzr/
 RlnmE+HpvL03E8dfOhxLZhcYZNFWbnInJ/LSmF57AobpbHSxZbrYS/pPTkHd5Q3mio1qT52zJeL
 /md73rZ3LgexO5iSUyJfK1JQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 25201c9cad2a3f1f;
	Wed, 18 Nov 2026 15:20:16 +0000
X-Mizu-Trace-ID: 25201c9cad2a3f1f
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Ene <sebastianene@google.com>,
	=?UTF-8?q?Bart=C5=82omiej=20Grzesik?= <bgrzesik@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Radu Rendec <radu@rendec.net>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 12/13] KVM: arm64: Reject ITS commands whose IDs are out of range
Date: Wed, 18 Nov 2026 15:19:03 +0000
Message-ID: <20261118151904.4099560-13-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118151904.4099560-1-fuad.tabba@linux.dev>
References: <20261118151904.4099560-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_152023_825495_ECD07953 
X-CRM114-Status: GOOD (  22.44  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ITS can't be relied on to reject a command with an out-of-range ID.
IHI 0069H.b 5.3.2 makes the response to a command error CONSTRAINED
UNPREDICTABLE, and one permitted outcome is "The data that generated the
error or errors is treated as having a legal value, and the command is
processed accordingly". With an out-of-range DeviceID, EventID or ICID,
the ITS then accesses memory past the device table, the ITT or the
collection table.

Bound each ID before forwarding the command. The DeviceID is bounded by
GITS_TYPER.Devbits and the device table, the EventID by the size its
device was mapped with, and the ICID by the ICID width and the number of
collections. A device that isn't mapped, a retired one included, has no
EventID in range. The driver never allocates an out-of-range DeviceID or
EventID, and never sends a command for a device it has unmapped. Its
ICIDs are CPU numbers, and a CPU's number is out of range only where the
ITS itself treats the MAPC for that CPU's collection as a command error.
Once the hypervisor has the ITS, a command with such an ICID gives the
host a data abort instead.

MAPTI's pINTID, which the ITS only stores in the ITE, and the RDbase of
MAPC, MOVALL and SYNC are left to the redistributor series that will
follow this one.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/its_emulate.c | 48 +++++++++++++++++++++++++--
 include/linux/irqchip/arm-gic-v3.h    |  3 ++
 2 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
index 4a3659f727a94..e7040de69a75a 100644
--- a/arch/arm64/kvm/hyp/nvhe/its_emulate.c
+++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
@@ -46,8 +46,12 @@ struct its_priv {
 	u64			cbaser;
 	u8			id_bits;
 	u8			itt_entry_size;
+	u8			dev_bits;
+	u8			icid_bits;
+	u32			max_collections;
 	struct its_table	tables[GITS_BASER_NR_REGS];
 	struct its_table	*dev_table;
+	struct its_table	*coll_table;
 
 	/* Sorted by device_id, in the rest of the donated pages. */
 	struct its_device_map	*devices;
@@ -229,7 +233,7 @@ static bool its_mapd(struct its_priv *its, struct its_cmd_block *cmd)
 {
 	u32 device_id = its_cmd_get_deviceid(cmd->raw_cmd);
 
-	if (!its_publish_l1(its, device_id))
+	if (device_id >= BIT_ULL(its->dev_bits) || !its_publish_l1(its, device_id))
 		return false;
 
 	if (its_cmd_get_validbit(cmd->raw_cmd))
@@ -240,21 +244,41 @@ static bool its_mapd(struct its_priv *its, struct its_cmd_block *cmd)
 	return true;
 }
 
+/* An event of a retired device is out of range too. */
+static bool its_event_in_range(struct its_priv *its, struct its_cmd_block *cmd)
+{
+	struct its_device_map *dev;
+	bool found;
+
+	dev = &its->devices[its_dev_search(its, its_cmd_get_deviceid(cmd->raw_cmd), &found)];
+	return found && !dev->retired && its_cmd_get_id(cmd->raw_cmd) < BIT_ULL(dev->event_bits);
+}
+
+static bool its_collection_in_range(struct its_priv *its, struct its_cmd_block *cmd)
+{
+	u32 icid = its_cmd_get_collection(cmd->raw_cmd);
+
+	return icid < BIT_ULL(its->icid_bits) && icid < its->max_collections;
+}
+
 static bool its_process_cmd(struct its_priv *its, struct its_cmd_block *cmd)
 {
 	switch (its_cmd_get_command(cmd->raw_cmd)) {
 	case GITS_CMD_MAPD:
 		return its_mapd(its, cmd);
 	case GITS_CMD_MAPC:
+	case GITS_CMD_INVALL:
+		return its_collection_in_range(its, cmd);
 	case GITS_CMD_MAPTI:
 	case GITS_CMD_MAPI:
 	case GITS_CMD_MOVI:
+		return its_event_in_range(its, cmd) && its_collection_in_range(its, cmd);
 	case GITS_CMD_DISCARD:
 	case GITS_CMD_INV:
-	case GITS_CMD_MOVALL:
-	case GITS_CMD_INVALL:
 	case GITS_CMD_INT:
 	case GITS_CMD_CLEAR:
+		return its_event_in_range(its, cmd);
+	case GITS_CMD_MOVALL:
 	case GITS_CMD_SYNC:
 		return true;
 	default:
@@ -627,6 +651,9 @@ static int its_take_tables(struct its_priv *its, struct its_pkvm_desc *desc)
 			copy_pa = desc->dev_l1_copy_pa;
 			its->dev_table = t;
 			break;
+		case GITS_BASER_TYPE_COLLECTION:
+			its->coll_table = t;
+			break;
 		case GITS_BASER_TYPE_VCPU:
 			/* Writing it while the ITS is enabled is UNPREDICTABLE, so take it. */
 			if (its_vpe_table_taken(t->baser))
@@ -642,6 +669,17 @@ static int its_take_tables(struct its_priv *its, struct its_pkvm_desc *desc)
 	return 0;
 }
 
+/* GITS_TYPER.CCT indicates whether the ITS's HCC collections add to those in the memory table. */
+static u32 its_collection_count(struct its_priv *its)
+{
+	u32 hcc = GITS_TYPER_HCC(its->typer), in_mem = 0;
+
+	if (its->coll_table)
+		in_mem = its->coll_table->size / its->coll_table->esz;
+
+	return its->typer & GITS_TYPER_CCT ? hcc + in_mem : max(hcc, in_mem);
+}
+
 static int its_take_devices(struct its_priv *its, struct its_pkvm_desc *desc)
 {
 	int ret;
@@ -697,6 +735,9 @@ int pkvm_its_emulate_setup(phys_addr_t its_base, phys_addr_t desc_pa,
 	its->cbaser = readq_relaxed(its->base + GITS_CBASER);
 	its->id_bits = FIELD_GET(GITS_TYPER_IDBITS, its->typer) + 1;
 	its->itt_entry_size = FIELD_GET(GITS_TYPER_ITT_ENTRY_SIZE, its->typer) + 1;
+	its->dev_bits = FIELD_GET(GITS_TYPER_DEVBITS, its->typer) + 1;
+	its->icid_bits = its->typer & GITS_TYPER_CIL ?
+			 FIELD_GET(GITS_TYPER_CIDBITS, its->typer) + 1 : 16;
 	its->devices = (void *)(its + 1);
 	its->max_devices = (priv_pages * PAGE_SIZE - sizeof(*its)) / sizeof(*its->devices);
 
@@ -711,6 +752,7 @@ int pkvm_its_emulate_setup(phys_addr_t its_base, phys_addr_t desc_pa,
 	ret = its_take_tables(its, desc);
 	if (ret)
 		return ret;
+	its->max_collections = its_collection_count(its);
 
 	ret = its_take_devices(its, desc);
 	if (ret)
diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
index cc6279087678f..b1b8fcc85fbe5 100644
--- a/include/linux/irqchip/arm-gic-v3.h
+++ b/include/linux/irqchip/arm-gic-v3.h
@@ -392,6 +392,7 @@
 
 #define GITS_TYPER_PLPIS		(1UL << 0)
 #define GITS_TYPER_VLPIS		(1UL << 1)
+#define GITS_TYPER_CCT			(1UL << 2)
 #define GITS_TYPER_ITT_ENTRY_SIZE_SHIFT	4
 #define GITS_TYPER_ITT_ENTRY_SIZE	GENMASK_ULL(7, 4)
 #define GITS_TYPER_IDBITS		GENMASK_ULL(12, 8)
@@ -401,6 +402,8 @@
 #define GITS_TYPER_PTA			(1UL << 19)
 #define GITS_TYPER_HCC_SHIFT		24
 #define GITS_TYPER_HCC(r)		(((r) >> GITS_TYPER_HCC_SHIFT) & 0xff)
+#define GITS_TYPER_CIDBITS		GENMASK_ULL(35, 32)
+#define GITS_TYPER_CIL			(1ULL << 36)
 #define GITS_TYPER_VMOVP		(1ULL << 37)
 #define GITS_TYPER_VMAPP		(1ULL << 40)
 #define GITS_TYPER_SVPET		GENMASK_ULL(42, 41)
-- 
2.47.3


