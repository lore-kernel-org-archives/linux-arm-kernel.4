Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E68E606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UItE3acB;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=B/yk8fLK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tewiO/fcU0kVXHUFtT/bhkFJMYsz1DEUUMUqBRKDrXY=; b=UItE3acBX2LLAbf27LP28+rAZl
	BrWx2/fuq4naqbDySVJuNM9RhqxYOncXAheln6bSlC1N9MG7D2qmYzFd0o4GnmQgK1jpzor9WfiWD
	92tHg9AMxiyYJEELO/GkkDpqK9Khw1k755sONMBeqbjMQjQjyybYyCVd3V3eKVq/gdA+Vsh077387
	mEEdzgGO5474fTFd/cC9I/cfVJy8ctojOjiIDngs9RfzcrxMFb6fx244Vs54VWzToV6kXEBAqT6Mw
	o1J4d7uav0ExEpQbHheJsQjSIRkK0Ed3SnhW4K36dv+I2tPplxDraM/rwO0BlGjJ3FvGLsqYaXopw
	Azfx8Hnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfzL-00000002km0-39IE;
	Tue, 10 Nov 2026 07:09:51 +0000
Received: from cmccmta2.chinamobile.com ([111.22.67.135])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfzI-00000002kjW-09x8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 07:09:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=B/yk8fLKa8u8YzWQaAhx5Htj4Cxgod8Tgg2yorYVBYbIBBejh6dxHaf2+c2wvB5rbib4JLRFFaQXw
	 a2PZDoUMUpG/zW9jmEIigOxtpLerJddbfX2NXYt6mFQ7ZqC7y+x0oJ480UwIzXhWFCo1kgchtzXB28
	 5u0Yb8q2idRAhZus=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36af2c33992c-980d8;
	Tue, 10 Nov 2026 15:09:46 +0800 (CST)
X-RM-TRANSID: 2ee36af2c33992c-980d8
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96af2c3377a6-ab659;
	Tue, 10 Nov 2026 15:09:46 +0800 (CST)
X-RM-TRANSID: 2ee96af2c3377a6-ab659
From: zhaofeng2 <zhaofeng2@cmss.chinamobile.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] PCI: j721e: fix OF node reference leaks
Date: Tue, 10 Nov 2026 15:09:41 +0800
Message-ID: <20261110070944.996-1-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_230948_626240_436850B5 
X-CRM114-Status: UNSURE (   4.26  )
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

j721e_pcie_ctrl_init() and j721e_enable_acspcie_refclk() resolve
syscon phandles with of_parse_phandle_with_fixed_args(), which takes
a reference on the resolved device node.  Neither of them drops it,
so the referenced device node is leaked at probe; and since
j721e_pcie_resume_noirq() re-invokes j721e_pcie_ctrl_init() on every
resume, the leaks repeat on each suspend/resume cycle.

Drop the references once the phandle argument has been consumed.



