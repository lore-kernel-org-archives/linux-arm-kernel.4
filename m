Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87A8606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TI88USr/;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=TVW6E5zl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mFWMcEq0A2KYP6XuDqI4w4rCF7exJvYvPu4K6lEomaI=; b=TI88USr/LPyG1o0k0+EwZ9vivx
	Wt/tOmZYaf0siq9H+BdmJO6exJGcgPVhQACR1FnIQLojQnM1CDXT1N9qKxT+g/WDmXXa54TkotGS8
	ywPMQKYlrdSO+ti45+u73Ul0xwb41zR0MpaY7v6WXvrAp3sqeIjaNnu2dxGdEtTAq4IgbviRzd1Tw
	R3VcH9gUh2FDFBDWNdheTx/6YPLaRpTiHFnCUWLiR8V3qrbxjJl6g385QaCI1ZCh+wO/XJsWo0A10
	S84rZONBFDQ8lPsPwBRIWajzCSfCvdTh7sy0ice3wNMT9fU6lNuegV73+yzs1g00Av4iJ2BJjD9AA
	utBF+3dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQBD-00000002fn5-2Knj;
	Mon, 23 Nov 2026 09:17:43 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQAy-00000002fiq-0cQD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:17:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ueEip6qXODUZw8Ul6q9goviS0rKMOpwQGBotIdtEFHqtmO5klLoh9OsdZOD7swVj9gVOCX0oU2h27Ae2BW+UIzIblwBw/dQ5/4dS429aUvAdzlS1Jhjzg+nxXrw4qmP2SoMJq645zQ9+401MpfSUN0p9Cr2bSvTiLlT6sKVTZa/q5MvPyutMCVXD4Ha2pnwBpLf3YylDJpVnwuvb/bEE343qfl5+n4ixmTNxs30NJh6UpTo9iBUBm8rbL/madHFNbGxj6LNe+TXLaH2JyV/mPq/WJJol6n0s2SGNeCE1LiMG6S4PzbznwUyfT9XrvvykwSlFNQAiWUjPILXIaUjOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFWMcEq0A2KYP6XuDqI4w4rCF7exJvYvPu4K6lEomaI=;
 b=YW9VG4WHSS8Z27eL5DgnkixDftg0hLJ1xwbYMr+5Kr7kBijGQjWrxH4ecWwscQ5xkn5MJAiJPYsQu5cn8ykc4fTvyqMpJIBjY2uXN0RBg6yo7MxzL3MLdOEHDbBOg/84bQFft9Omg71gt+X6kxXs3lrvsjTu7BmeXxHlFeV4LOOBFdZXDJswO6u2mg3sufl3ap6OnKidFNno8oIW6nAgq5cfl94j1/ASQwcaazTmMLAi+NVsDrDCjtcCIKBGZFKhFmkR+uCLmOLLhFYrSqVbWRoI25MtY7o9NTcvoBclaCSE7qhZO6NMuN0un7rvC0CYRhhR/6Xy7aKb+k2Lbyscpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFWMcEq0A2KYP6XuDqI4w4rCF7exJvYvPu4K6lEomaI=;
 b=TVW6E5zlUq5c9JoKFF3bvwcCxJeaK0IRHLs+K2ZUlBMVbGGqba4FcR7JdXzDoiX0k9KK+qqQ/Jcd7ZfTVE7yb1eAzvSLg9bBOhbL4NHcVImp9BGV17EadjFHo1bZA4BOXygWdn1AE9AYXhlAcgw44SWU4p/hYCp8h07XdTAyxa/wkKgWg5n6jENTJstv8gsmdxvjBtjOrsr5Nu81lrTiy4B61ioMgGPpSjZZaJY46wTjrITWuwXwpDK76kACROfyebnXwSuQK5LOlWVHOviH2ByrcPjrgF7LgyiBnLojfvLQF2q47g9EYJk+7bk6S2sDO5h3FmR44be7SIMBkNWX7g==
Received: from AS9P250CA0020.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::22)
 by FRWPR10MB9420.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:d10:1a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Mon, 23 Nov
 2026 09:17:20 +0000
Received: from AMS1EPF0000009B.eurprd02.prod.outlook.com
 (2603:10a6:20b:532:cafe::6e) by AS9P250CA0020.outlook.office365.com
 (2603:10a6:20b:532::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 09:17:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000009B.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 09:17:20 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 23 Nov
 2026 10:18:07 +0100
Received: from localhost (10.48.87.222) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 23 Nov
 2026 10:17:19 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Subject: [PATCH v2 0/4] dmaengine: stm32-dma3: fix IRQ flag race and
 linked-list handling
Date: Mon, 23 Nov 2026 10:17:04 +0100
Message-ID: <20261123-dma3-fixes-v2-0-0a5b013f79d2@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJAEBGsC/02MTQ7CIBBGr9LMWhoGTA2uvIfpgsBgZ9FimIZom
 t5dbFy4fN/P20CoMAlcuw0KVRbOSwNz6iBMfnmQ4tgYjDYDIjoVZ29V4heJikOwRBh99Bra4Vn
 oKNr+PjaeWNZc3oe74jf9aYz+11RUWiXjAqazvVjnbimL9LL2Ic8w7vv+AYIypMGmAAAA
X-Change-ID: 20261119-dma3-fixes-d6c3ee1dada0
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, =?utf-8?q?Am=C3=A9lie_Delaunay?=
	<amelie.delaunay@foss.st.com>
CC: <dmaengine@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Jerome Audu <jerome.audu@st.com>, <stable@vger.kernel.org>, Frank Li
	<Frank.Li@nxp.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000009B:EE_|FRWPR10MB9420:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7a6c95-528e-45d7-cacd-08df494293a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|6133799003|18002099003|13003099007|11063799006|56012099006|261028144727099003|261026121527099003|261026140227099003|261102123227099003|261022075727099003|261021123027099003|261021121427099003|261022105027099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: q3zqk/scH0/dFxOq8XaY1gM+d+rh6yzq9V+j3Psnp5RmjLgW1EAg3jg/r7mSv8cm7uWR38kbVoyJgTMuP0RVtYyne18rU8YdbCBXhNoNO82t+0XK9YsAERVnP6OVanbSHhQYgoS4Y9RZgfHLA20ZGP/onKtnpfuzZBHZr7emxJlLkgJMnuNzuTiDpvelW/SkyNN1ntc5GVGsSNDAicAd1VW34A9D+LAfBOIAPc1UpQd4oEQnuEfXZpYUtO0tD1t5m/fqRKcC2eLFV3zDth1jyvnVF0FpWmtQoyJQ1Beun0SIcwR5BEwEhyIaApxzWn+3weTlAujx+4Ic7CYu+1yabYJ7+fUOavQWzpb9Rlh/EtBtMvuZAFITW4Or6an2bpq9SCflIQWciAVUEEGiD9bNsf32cwzYc/AXtIl2JYuONf4hTItvX/6QXDraAcdemPO4LeYu5kmy/6E8RiAAM4ibF0sTtmjCo0G45mEEYvhQNN8l08jZ26HnMVZV9lLjpUqQnjoGbspe6e7/K2duz6Wj1wYmIm9JD6QZUc/KlclP0apoEo1kgTDXdwwmb/c612ZV8UMwzs7lGnbpPCoI1TM+qZyke4nk2J8JZc3enZrZEIJ300Ii5TibvVIFpAM1QBFMGvheUEmplcoRfdG34zvP8KeAUBjpEfVye2qVgxzFggI=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(6133799003)(18002099003)(13003099007)(11063799006)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261102123227099003)(261022075727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DUGozIcyxY9UhjuUOeMj2pqWcGprwhiB6RqqAEydXWUfNgwxwL5T40Anu71TvJuDOQLcvaEhvLhVGOrQZoLy9lDBcQtGe+oVKaicNxdxNymikMrJAJzKyegliUhSRyJPpb+bYvvGZ0EpsC14FIlgiYOo3crVbPEFxy5G7dHPdqOUNU3vNP2WqeN6Lnypq/UDlPTyifdzvQcoXH6XjnkiObFg0P6oUjYHQmaI2jwq5bgXzXH+5K7kNIQosTDfwmHR2/tunWoETBu20AWL5qlZDXVS5lsi2gd+tsxylxQjtzvPLizk43EUhr2z0enmksQZe6JOSuPH5IPL3OIk15Zz+1UyImTumQ0nW7FXkMjyLx8/HqnHF1Z8f/pyIkXRG4yjAotnamXrGbqB8edGd4KzJ+GpjZdQiw6CFAemLZkfgD+UKn02igVrLZ1ERtzcaNXU
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 09:17:20.2979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7a6c95-528e-45d7-cacd-08df494293a6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000009B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR10MB9420
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_011731_456973_B4BF8784 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

This series fixes issues in the STM32 DMA3 driver around transfer
completion and linked-list (LL) handling, plus a related cleanup.

- Patch 1: clear channel flags before handling completion, so the
  Transfer Complete flag of a new transfer started from the completion
  path is no longer cleared, which could lead to a timeout.
- Patch 2: write the LL base address (CxLBAR) when starting a transfer
  rather than at allocation, as other transfers prepared in between could
  change it.
- Patch 3: reject linked lists spanning several 64 KiB windows, since
  CLBAR provides the common upper address bits. Lists may now fail to be
  prepared when crossing a 64KiB boundary, which is preferable to
  the hardware fetching descriptors from the wrong addresses.
- Patch 4: cleanup, derive the descriptor size from the structure and
  correct the maximum descriptor count to (CLLR_LA / size) + 1.

Patches 1 to 3 fix issues present since the driver was introduced and
are marked for stable.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
Changes in v2:
- Address Frank Li's feedback: rewrite Patch 1 description more clearly
  and add a blank line to separate paragraph in Patch 2 description.
- Link to v1: https://patch.msgid.link/20261120-dma3-fixes-v1-0-f29c1f437399@foss.st.com

---
Amelie Delaunay (3):
      dmaengine: stm32-dma3: set LL base address when transfer starts
      dmaengine: stm32-dma3: validate LLI pool allocations and fix cleanup
      dmaengine: stm32-dma3: replace hardcoded LLI size with aligned descriptor size

Jerome Audu (1):
      dmaengine: stm32-dma3: clear flags before signaling transfer completion

 drivers/dma/stm32/stm32-dma3.c | 78 ++++++++++++++++++++++++++----------------
 1 file changed, 49 insertions(+), 29 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261119-dma3-fixes-d6c3ee1dada0

Best regards,
--  
Amelie Delaunay <amelie.delaunay@foss.st.com>


