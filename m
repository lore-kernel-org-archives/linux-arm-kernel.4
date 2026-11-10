Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFD7606B506
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L47CSQPv;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=LK8zMZr0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p0b4HYMjqgMZb222DZNYKa+IKVop6pKB2asojuDpXTg=; b=L47CSQPvaRnViY
	aoIofXa7WwQXmfXtoHk5/RGTOh7t9nzDehPrHG5Xo4yNIV3rQqR6chJmiGamRcXYDWYq6a3BCOcbT
	J2W5Pfk2kPTKf+XnXH3EMUm5xX0J/XSubaHzBKOSEqhOTeDtw92XhlbEW5ZmrSqV4sisFEc2Phids
	+HjgP5VJEwlfFaEGhMSJTgp648SohBI8NCJ6R4fKqE72aPp9cb9fM+mHc2meZUheLDpEbVUNN8gZI
	JmDTfChpOb361p6UVZT8Ne5eJqyHoa3Ue+biRxMNqSB8O/rlvaKJEf5Apmgwo+C0c6XaT3+b/Hj/m
	Ew0mJUI0e5ZUCh8DzTvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiny-00000003Pyg-2MJN;
	Tue, 10 Nov 2026 10:10:18 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQinn-00000003PuM-0A53
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=LK8zMZr0XH3fzL01T74alwSck9G456YEc/RkYQ8QaHpilcTzVi66bOHmb3yWrhRmWsHMpTAnmIKIz
	 Zd1uQqP17pnAM4AaeLWKFDgoPZqZlR4hDGbRoKt/0jiyX0ehQZVnlIbZHMthGLj6Tbc2qGEb/Yijuh
	 57eMwoM2oJxpPL5U=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56af2ed778fc-cbe75;
	Tue, 10 Nov 2026 18:09:59 +0800 (CST)
X-RM-TRANSID: 2ee56af2ed778fc-cbe75
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from  (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46af2ed74c04-b1a93;
	Tue, 10 Nov 2026 18:09:59 +0800 (CST)
X-RM-TRANSID: 2ee46af2ed74c04-b1a93
From: zhaofeng2 <zhaofeng2@cmss.chinamobile.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	linux-pci@vger.kernel.org,
	Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] PCI: keystone: Fix device node leak in ks_pcie_am654_set_mode()
Date: Tue, 10 Nov 2026 18:09:54 +0800
Message-ID: <20261110100955.1046-4-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261110100955.1046-1-zhaofeng2@cmss.chinamobile.com>
References: <20261110100955.1046-1-zhaofeng2@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_021008_073490_B7B1D84D 
X-CRM114-Status: GOOD (  10.94  )
X-Spam-Score: -2.4 (--)
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

From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

ks_pcie_am654_set_mode() resolves the "ti,syscon-pcie-mode" phandle
with of_parse_phandle_with_fixed_args() to obtain the mode register
offset, which takes a reference on the syscon device node, but the
reference is never dropped after the offset has been read from
args.args[0], so the syscon node is leaked on every probe.

Drop the reference with of_node_put() once the offset argument has
been consumed.

Fixes: 7dcf07ac8867 ("PCI: keystone: Use phandle argument from "ti,syscon-pcie-id"/"ti,syscon-pcie-mode"")
Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
 drivers/pci/controller/dwc/pci-keystone.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -1059,8 +1059,10 @@
 
 	/* Do not error out to maintain old DT compatibility */
 	ret = of_parse_phandle_with_fixed_args(np, "ti,syscon-pcie-mode", 1, 0, &args);
-	if (!ret)
+	if (!ret) {
 		offset = args.args[0];
+		of_node_put(args.np);
+	}
 
 	mask = AM654_PCIE_DEV_TYPE_MASK;
 



