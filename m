Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01753606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GpWCWra7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aXSpH/MRstkp30+5WcNoVFHY0IbutKcDkDgC9PrCYak=; b=GpWCWra7W75Z2N/q17x47POK1v
	UIv0I3QvwPNp/awXteudKtATd7jmbJ4h1mRJcAQLMzHhqG5gv8WICUm6ZUxB4vO4+NcAhjNkLVS9f
	hC+aw3j7fKwLbJrBTZNSQT863seUvAe9VkLV0bWM+dK3LdYq89iTGMjL2mXo545vUMyQuDbXFOo/3
	psaV15W+IaLWhHjO02qQ4HaSa9e6NtD4g6gHfiCMySp2Y9i61mSKip6BRKGSfwRxvOv3Ij0bE8vgT
	7Dd/vvolNXOqWXm2F5IKmrBGOz58r7PEpqlPCdg19E72RcrhkQUQwDQXspwFZPA7kkjIMOCIQ4Cva
	nrARQsyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFjL-000000058wy-1Xzt;
	Tue, 17 Nov 2026 09:43:59 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFj8-000000058n8-0UTY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 09:43:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ez/U65mR9Ebrkf9AiCYDXuCJJyEyVv7N/kcdqD73KsMvy90MeHxvVqz2gssPYSUv4FbggX+y+0O8ENYrWN3S2hacIBKH2QY68HTShhOYykQPJ5wpk7RgUB7Mg2Vv2nbXhAHE6JQ/+/RBw9IeFCYqqzSQ4lu9YPlWchTSWhF1bEzQbpLOT6r+/llC675ADhwC9gIa7MGixPN2BsBCh36YxhK3Ts+gWLATsAC3KWPrB1GQp7Gcb2uvCoTFY0SQZFlVcC6T5pTzCc5w0yHsTFuSx2hbwBaKj6usG4ErLnkUsGV8VmpoC4UqslSxPkVi3cME5tzLaDPL9eBMfX+Mv178Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXSpH/MRstkp30+5WcNoVFHY0IbutKcDkDgC9PrCYak=;
 b=orxnc/TTblbpRZbs4bY3syiMYiAo7iRt4RIlzoKppYVB860eVSxXpQLhNLYQdMQV/CrzwVTTij/n/MY42FlpVI4K6DLtaVAf78MbEmRxab4arX11nTTuPsJim41B7BZECknB2p0/AYgQcOdCNx4rf6Ye/VXwv/NPaV2P1iPMn80qWCCMvGCRQJgOltgKjBs8IOztagMOpFs6yhyequYBxG2t0+7+YdicH7GnH5rT3XvQ2Hph4EUUV0QY3RbqMQoVFsZep3E+VWN6+z8RO3kwB3r29r0UnMTzXVKEbkrfeOyitXiPxjwF9ezRJz2YuudyUtz72uWR8eDBo170JSoCqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::18) by TY0PR06MB5103.apcprd06.prod.outlook.com
 (2603:1096:400:1b9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 09:43:39 +0000
Received: from SG1PEPF000082E8.apcprd02.prod.outlook.com
 (2603:1096:4:193:cafe::93) by SI2PR01CA0046.outlook.office365.com
 (2603:1096:4:193::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 09:43:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E8.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 09:43:38 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C2C1840920E7;
	Tue, 17 Nov 2026 17:43:37 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com
Subject: [PATCH v7 05/10] dmaengine: arm-dma350: Report submitted descriptor status
Date: Tue, 17 Nov 2026 17:43:30 +0800
Message-ID: <20261117094335.1393735-6-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
References: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E8:EE_|TY0PR06MB5103:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2f9e9c68-4385-419a-fa17-08df448f41fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|1800799024|36860700016|10067099003|56012099006|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3XELKxg3SUHKbV3cK/3LPIW3ZZ7Yzw727o8cBq9aTSBdgfPzpMuR5I2/gSBaIq1qJadYqdgdpegUHkrGwd2NltmQZyLAS7EKN9zn0rZ+dIDIkj0YJpGqG+wlO2OQvQ9n1LMvXDlavDqssq89e5HcbclLKayiTo8PNvTBiKZXdK+u9PJs/N/IslEITp7J7mbgQ+wxvmqB7KxGjHGsbL95p+o4iv92eTRIb9uouGdriZYbwWCka5tO8YJTrBPTikq4MKOpjkPa1uaLsgiE5+fcJ/h/vWvu7ypwj9r3771uFSPnesnfabS/AO8tSqw4HgYGjwDZkwm5sNG2Gq5K0lKeqztapXx4oDQDn4EYtMO+/1k0pQn39VHx9JVhQxHpoOUCg50q45U6OICnpGWo2g9RwgsdT3L2tMGL1uSreSmFvDL4k3aH3sMScmYZfVFxDzEQkPXlgNesJvOpI8dqfovwb9Sa4HvfX6AqPjqs9NicMxIQM5S8GI1el47aMvXOcUe8oR7Kj5gtGqDkA5rzzbHBtskPcXYCoBXhtj9hzuJXC/uDuCC59Y90+iEUc/IkMWeUptbM+rqvNtSWF1G/4uw3yM6Jcm1UzdS9ycKEkW9mydSG+NUtw36QOGyO3//zto94TqFDIiVsHjARyCWLjgUAUw609YFfzZI3Q/CRlzkUyEa5HqvrsIl+2109za+rdZgvk4IN1E3TNVkjA6NqjZe7xQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(1800799024)(36860700016)(10067099003)(56012099006)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: et5z7dTsUJu3vaADnrP1OjLUxUHa1gvcO8Mk4dUC52Efd751wGMhkTrl408BDTZWbcqUurMUp0cSzHj1MFTCa3bdA0M6+MOt3JGL1B+i6M3Z25bQC91TKpfM/B+o+bCEr/FeDSpdw3KCu32QRbZv+INwS21nFitpVf/LaWY+MMTXCGcnFDpUcyK7pT1Md89ArJsI737owlOejum4G5iQSgNmEZmhSPXUWl+xvVSctL7+d4tVzj5QH0SaatAkDz9bpr7UcbXL5LETja7jXCXz0f/IdJyUJ/giKUocA6SFWKKWSqdaKHQ4ySnM38izZFbn2uh5r136nBG46I/INvl+hXzZpPk8Jv4wuh/SexvhsoTfro3155u5bIkAPb7R6Ne33Z7xO9n2DvJkZT9lG07LSvxtjBl/yTdxEyUvfrqUN15Ik7xT876Jg7xFr6iLWF04
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:43:38.6359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9e9c68-4385-419a-fa17-08df448f41fd
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_014346_158753_3B7DA1B4 
X-CRM114-Status: GOOD (  11.47  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A submitted descriptor can still be on desc_submitted before issue_pending
moves it to desc_issued. Searching only the issued list misreports such a
cookie as failed.

Search both submitted and issued descriptors when reporting queued work.

Fixes: 5d099706449d ("dmaengine: Add Arm DMA-350 driver")
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index af1b030b955f..f785251935f4 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -390,6 +390,18 @@ static u32 d350_desc_bytes(struct d350_desc *desc)
 	return ((u32)desc->xsizehi << 16 | desc->xsize) << desc->tsz;
 }
 
+static struct virt_dma_desc *d350_find_queued_desc(struct d350_chan *dch,
+						   dma_cookie_t cookie)
+{
+	struct virt_dma_desc *vd;
+
+	list_for_each_entry(vd, &dch->vc.desc_submitted, node)
+		if (vd->tx.cookie == cookie)
+			return vd;
+
+	return vchan_find_desc(&dch->vc, cookie);
+}
+
 static enum dma_status d350_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
 				      struct dma_tx_state *state)
 {
@@ -407,7 +419,7 @@ static enum dma_status d350_tx_status(struct dma_chan *chan, dma_cookie_t cookie
 				dch->residue = d350_get_residue(dch);
 			residue = dch->residue;
 		} else {
-			vd = vchan_find_desc(&dch->vc, cookie);
+			vd = d350_find_queued_desc(dch, cookie);
 			if (vd) {
 				residue = d350_desc_bytes(to_d350_desc(vd));
 			} else if (status == DMA_IN_PROGRESS) {
-- 
2.54.0


