Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4986A606B505
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HJ9ywdtP;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=glRdxrF8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xjtSKY+SmWPwxrp+IkseqPFtAqPIeZiD8ojI/qHqMgI=; b=HJ9ywdtPZRp4ThFED1ywwqryvo
	I+Laz4F5LRfR9LBE+JYuR6uatMkSeUGcxlrJNqOEznzKcSQ1+nZ/82c2GFO103fCVkNlQWe7ZmZNU
	W+u8k0immYgF4LIVJjX+c3PbnR7GozyPJnuJuPV6QoaygHq8vurEBAwqG99VvDlh5sZldf26F9Dxf
	jrvn1NhQZ9oBjchtbG1207SNyYZZ9Ec8lXoWFGHr8+jSldGvWyObTZ/zwF8UZ5aa28NRHVtsHYAlw
	6ltStzK0uaMGpejkG+/YyHXjWIipNO/5kLBSQrMMb0TSh+VIhmv4p/xMsq8icPQkxSNvXVaA60oG7
	7K8WXZ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQins-00000003Pw2-0AUr;
	Tue, 10 Nov 2026 10:10:12 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQinn-00000003PuO-0D2T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=glRdxrF8fefh3i3zaQG1U+cLe7B2zAr8I4HsKFQr2GTY0MbOw4GfGGi2xeaguk5MD1nQ2bHIU6+XH
	 8tVvz0CZIuttp4EWfr5lMZIpuYU+/GImNViwp4HbUNevl4gfHofwNK0Rb88HAyMmCLaUD8rAjmM4xE
	 bopypUj84EcNrM+g=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af2ed75908-d3bee;
	Tue, 10 Nov 2026 18:09:58 +0800 (CST)
X-RM-TRANSID: 2ee96af2ed75908-d3bee
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46af2ed74c04-b1a88;
	Tue, 10 Nov 2026 18:09:58 +0800 (CST)
X-RM-TRANSID: 2ee46af2ed74c04-b1a88
From: zhaofeng2 <zhaofeng2@cmss.chinamobile.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	linux-pci@vger.kernel.org,
	Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] PCI: keystone: Fix device node leaks in syscon phandle parsing
Date: Tue, 10 Nov 2026 18:09:51 +0800
Message-ID: <20261110100955.1046-1-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_021008_074918_7AF13F0A 
X-CRM114-Status: UNSURE (   5.43  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

ks_pcie_init_id(), ks_pcie_set_mode() and ks_pcie_am654_set_mode()
resolve the "ti,syscon-pcie-id" / "ti,syscon-pcie-mode" phandles with
of_parse_phandle_with_fixed_args(), which takes a reference on the
syscon device node, but none of them drops that reference after the
register offset has been read from args.args[0], so the syscon node
is leaked on every probe.

All three call sites were introduced by the same commit, which
switched the driver from syscon_regmap_lookup_by_phandle() to
of_parse_phandle_with_fixed_args() in order to obtain the register
offset from the phandle argument.



