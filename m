Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F913606A895
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=etxZ1aYt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VZrSVwYpZW/2P1ljs/nVCcJV57bpcGcXU/xs6looOUw=; b=etxZ1aYtQcDVRzK6b1tw6EGQTh
	3MjTIe6xcs9wMkwwUV6+l3hE+VufgZYmUDlGdjdc721JrZW1TRRXuwPEgemzuL+KCiYodRFKAoiyl
	o7BVPzTRocYitfWbynGZl1CkQI9dtu87ohy3RB4Nm1cepWQsDwWVPaASIqp69aaoZ9oG2wV9DbaSb
	1+6WKPFMD1zhYasJYRz275VvuHV3Hmkh8Uf9dzQkqU0okqpte8S9MBCrh+slGk5MuDaTygeb9Zdct
	LudL4vWRPh+beOcPyrid56x2qZkDCu1jq3sYxS5H2lF01X/yt1LxI2/6+BF+5ml5vr1v03dsQnFdx
	f/WLTsEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFk7-000000059q6-2eZK;
	Tue, 17 Nov 2026 09:44:47 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFje-000000059Kt-1bGh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 09:44:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eq5sNoeQbni7UpxAhY3rmWy3KXTwSmzXU28JM4+HxhWNRzgtsWDQGWwQGJjK0QuaV2GGSxEW8cggW3xjyl1srvVEMvWz5POxclNl6aiFwiKwC8/v6k8mZBRmeDQoP3GQxfNremsHFNDCdESoNy0zfXCGIifaqU4GUXPhOJFCNOoOe09iL+hyStYGfHA45dzjCxpZf2dhJ4KS1LdSqyvKNJaC0iPWacYP/VACJQ3JwtPmArqEgVkPF556o/xfdHdcpbGjmE4vE8XmFFeZU8FlKJ6iWdrgf/6/oAH8ctH5EEmSZUqWTbomgvrgQROvZyjCf0jOFrVGqeX2loacyo8oQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZrSVwYpZW/2P1ljs/nVCcJV57bpcGcXU/xs6looOUw=;
 b=Wr2uWXvZq3mmmuNVKItEXuXdxq8EyDCzhzs5vVhJ4BMIbr2uWZfNUi7SDfPge8vJgjaQhYCSIUxJXp4s5cf6FotChbURE1FGC11AwhCnqvEVS9zCKRxwQhd5UkShTZJlEJxjtQ3kr9gyfd8y6fhagSlR17bQfL79lKgb2AzUXYBkLDoGaTTp6w8J8FXN2CH1E6u173iANdpQo9OgKpYKOYGViGrbpHYJk83CJbfBeG+/Ta1PD8sZyodUyufMbI9SalgTUaOigKnBcBMcJU6UdKeeDzm3Dtz9Ilsa78AJAqkG1krjs14fBnOuqDgA1KMbH4kstThITdW3wRYOtCfobQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2P153CA0030.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::15) by
 TY0PR06MB5802.apcprd06.prod.outlook.com (2603:1096:400:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 09:44:13 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:190:cafe::95) by SI2P153CA0030.outlook.office365.com
 (2603:1096:4:190::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.4 via Frontend Transport; Tue, 17
 Nov 2026 09:44:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 09:44:12 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D4BC140920E7;
	Tue, 17 Nov 2026 17:44:10 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	tglx@kernel.org
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com,
	radu@rendec.net,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 4/5] dt-bindings: dma: arm,dma-350: Document dma-channel-mask
Date: Tue, 17 Nov 2026 17:44:07 +0800
Message-ID: <20261117094408.1393837-5-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117094408.1393837-1-Jelly.Jia@cixtech.com>
References: <20261117094408.1393837-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|TY0PR06MB5802:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dffb4d43-5ecb-4bc3-db44-08df448f55e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|23010399003|36860700016|921020|261102123227099003|10067099003|56012099006|261026121527099003|261021121427099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: chAg5SlE3f8D/rGGPCgStHm1mgTjurP257mZzizOx4FvdU8ipvOVZjge2762JyK7ksFdhDTHDyy/cDCcSgYsvVYv+g8zYY9Cve4hFmsXPKBoXptgfTZRnk0bN/oupEyT3IHVOfz1ONZZsVqnn0yST8Dmg6x3hJdZ/5DMi8PXFuH3O3qQGZEIxOutrEuEGJuYvssaQCe0cxvboP3gRpUSOzVXsHAfWETFz65vWtgg/mZkBbCL4XtH282WiBsL+OINKqUwu+rn4c7Fk4O6Dnfz8ZZ8EqbRdsGYW4Oh/DDWBYEqXkG0xz9rgya1WkboRi6/13WSbRHWUEmsLn+qd6YpDKDKd3ScTO4IoWeREl3pS9mJbGkPdHZ/aPAJ9DqufBq7WH5kcbcoOzSYEwmpc7XEuu3liHroxjDLvNfLMYLBt9KbC5lumBi5el96Q8UQgvt/gV1cmGmZ8K4NBErnQlFlqOyhYgRe/s85bpTTwyRzZd4xiEDW+e/5fKpScbR1cWtUuF+/cY5lzs/rLnH0/dL90aj9WLRixT1QFb2nOlhGBwy2fVrfJ8Vf5wvzbgUqa7mIYcVPh2nK2lVnZDqocxs6ubSypLoWzN6xWuKPQSRhJKmMWGLM4DGb0NrgU2Ezvedss7KpaZGw+cZhjAEnyrtln4q/fwza2Ee9iVhf1rNTMy6l4lSguMRNcRQxa1aAsskmeINITjWJKelZiP/QM6M90T9P4VIvYxkbvMGkHHzQf6uurq2BBnc58rgQTBOIviQ3
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(23010399003)(36860700016)(921020)(261102123227099003)(10067099003)(56012099006)(261026121527099003)(261021121427099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EMDdV2vL+AClFoPMYzAikfn0HTnq4+CgG3EJBZt7DWbI8bfai8mJrhdMRi6+LBSSbS8GYiVMfz1ISjLdyTx91221ldGhMSY5TIkUGc2uBZ/v5UEHjQ7WddbXGzUA0Qr2lcTd/DRzNY8fgT8nx2uwLSM9bfWDI3jZXN+9mm2nDfVNc+/0ZGeVFDAJhsQhNkHP4cmhUYxJrv9iN3VFWNnFC1KsDgNdco1WeEFpSVTB/E4bngEiSxtSYo4yKQa63fHji5Stk0Dd4i496ZeooioVulWWMOZg9pty39M7D3rsidju8ntPM66KeaFvxShzeq004CCzJ4SXVzH/nXmtjpUAFqf4F7YOemp1BnXqONkNvRrr49V1ql3zz/2mGwDSZWLlUgnWAYdUw47PvR3bmMiL3qUqe1uUvwAOMEg3B7s7dqOvYrWKrEXPLZjYacXhEgge
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:44:12.0302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dffb4d43-5ecb-4bc3-db44-08df448f55e7
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5802
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_014418_433758_ED428D5E 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
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

Some DMA-350 integrations reserve channels for firmware or another
processor. Allow the standard dma-channel-mask property so firmware can
describe which channels Linux may use.

DMA-350 implements at most eight channels, so one 32-bit cell is enough;
limit the property to a single cell.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 Documentation/devicetree/bindings/dma/arm,dma-350.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
index eab3b31aeba7..59f3b59b47f5 100644
--- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
+++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
@@ -47,6 +47,9 @@ properties:
     description:
       Optional reset line, where the integration exposes one.
 
+  dma-channel-mask:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.54.0


