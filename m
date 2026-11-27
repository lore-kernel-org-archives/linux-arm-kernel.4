Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEADA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RBkaadnr;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ol9I+d6/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2TsM750EvEyHCTYANfGa2Nzz7ULmsTnF7jQbx8T+XDI=; b=RBkaadnrSbsWF6MmOl0315F9nu
	hBeD0CNrTdYq3xTmZSySHWewq48kV7v0DzklUhbu4XfGgOA09+b6xxEdYDTL7fvq4wj6D+5Mv7ziY
	t156O4EEthAf1+3D+wCQ6kvnxQXJNX9n2m5vWYi1WnrWIptwIn4hPomrxqi3qo3B5Tcy+Ud4pUL4U
	DBkV0eRem6M7sSwo7tRsQmQX6jftyL4c6wFmRoScj30kDULAfdLpTGpXejBpI3KT3rRCythg0ngox
	X4MIaHMj8ztMBiqsTeHzihp+9q2WLuWJx2x2W0vVbSMUAhCJu+ZsiHm8uk8CzZNysddpRlSqEjaMj
	hJOBbWSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWssE-0000000FVl5-0IRN;
	Fri, 27 Nov 2026 10:08:10 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsrq-0000000FVbk-1sFN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 10:07:47 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so80707925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 02:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774064; x=1796378864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2TsM750EvEyHCTYANfGa2Nzz7ULmsTnF7jQbx8T+XDI=;
        b=ol9I+d6/7eQ02DBHRfUn5zBskhAlGlTXtTTwRJVmyFfL64ItVKDTdVt6R2w3+cupSo
         phiS4aPn3wjx8OM/d7dSxPufbYngEZo7pDlr43A5G06FRi4t4+4xZ3Q8McxpsdmfAt6U
         zHRmZ9VSpCgSsDiylmvtbI32zv3Vp3XlKm0047qTrtmhDzvyOE1GqVBrpKPP0nmQ9sid
         qZa9ikpafvLOG7AqmuX8K+0yrTwB3Kttud4ZKQjMSITUo3Ye/VBEPJPQa2qx0xic328x
         22EF8MpWlo8Gl9W3e5VmSQSVBJbIIlhueyhWjD6rQqpe8adjiyu9Zj0bwrtBxtN1FY5v
         372Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774064; x=1796378864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2TsM750EvEyHCTYANfGa2Nzz7ULmsTnF7jQbx8T+XDI=;
        b=xvOnaMr9dswcXqLEXE1qcAkgAQeK8OBWxWTD7ZaSRMtuadQt5qnhuPuXGpELuwJXDQ
         +geXysz6kh+8nBo/FgijBTEQUjMQX4kLriOZ2fjjI1gZWzxWDEvOSI8/8SBFfo9XybYW
         ZSECq2nF5sUGRsaTp8GiKTzNb/UjrfWR2uSIVEdc7yIGOg1GNskGFee2ijHbG39ed730
         lb7PgwWJgW6M6uZ3+c0f6s0iV8hA5oQDf4Ku7XHNBmDCYGQpFotZit4l2VBbhMLigGD4
         KtSj5/X13ZfuTdA1JohAdqVAQIE489X2kEOWmpKN1+Kg+pQi4KFu2T+x18RuJHkS3nUs
         KOjg==
X-Forwarded-Encrypted: i=1; AL+hErHMWlEuAwbJajmcLIEdar10ee75BwMVYkay3NIoHmJqmUfAWa/lcYKj1t41a/jksh6YZN6UFxuehQVYd5za74sL@lists.infradead.org
X-Gm-Message-State: APuU4Z+rB6JkgLyOB3lC6KgrGkHdm4XAUb4MBzLI2SbdJ5IcUWH7CHBS
	9GzSu8qOq4GtC/WWnkK+7Nwv0C/jDaD5xLLj+TWhDVZLbi8o9JBTkRkV
X-Gm-Gg: AZFdTZeDE9yj5uC7Q1zpp+4cHl7y84lWskYhAAmDXfUAkG5uU6jZZ/JXmywygGI1/PR
	tkHTnp8xrVOgySlqtJwGiza7TcSMmHoQT9f25Y7KpE4bysaFLc8shBzPcTWx+ZqVId39pPRP3lG
	ulI4+ZKCbTOzKOdeTEZ+dXfFc2He2hQGfuMImq+a79CflgQjY8BWroCIosT70JstIPEpz0VhFrR
	CtZVBCdTN5mJJWdyafj3y+Rmcoa90x2PDU9Mv+N4PgKbsXPmhJ4HYZf2gypTnx2NZomtCeVLZdA
	SGBprq60p97rlY6vXyRZscZpzO3oxNPK0ltuV4Kg4+wVh8UrY/NFrvenMT9V8WoFnoPCSmcAyYB
	Jbo1gyWzmJTmLDvQv6Llxf6yf2Q+/raTCJdOcRLoVDn+RTxgJcIhsW+BmAXuXgQQDBPjc/hmrXJ
	WUfblEikJQh0xDqlWm2vdom15E82E8WIuNhwXUG4jFe/lSOxP61MjIw/AfWg0URdbeO7B6Vky1J
	K9DUbVSuwbzMiWEe5EriXpzaKS1RByb4p2yZVaw15EbrAV8W4VSeKvCfvlRoTb063X9tb5UEewF
	79S28iPfHf9dY1pUIn5dawOb14ZHwPPrCgMfNZjFrHnz7fo=
X-Received: by 2002:a05:600c:4514:b0:4bb:6823:3d3c with SMTP id 5b1f17b1804b1-4bb888169d0mr516683475e9.20.1795774064226;
        Fri, 27 Nov 2026 02:07:44 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bba6a0d65fsm196561955e9.3.2026.11.27.02.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:07:43 -0800 (PST)
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh@kernel.org>,
	Aksh Garg <a-garg7@ti.com>,
	linux-pci@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Anton Protopopov <a.s.protopopov@gmail.com>
Subject: [PATCH] PCI: j721e: Properly check the error of a syscon lookup
Date: Fri, 27 Nov 2026 10:19:13 +0000
Message-ID: <20261127101915.1348807-1-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_020746_517857_138932C1 
X-CRM114-Status: GOOD (  11.49  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The syscon_regmap_lookup_by_phandle_optional() function returns NULL
only when the property is missing (-ENODEV). On other errors it returns
an error pointer. The j721e_pcie_ctrl_init() function checks only for
NULL and passes an error pointer to j721e_enable_acspcie_refclk(),
which uses it as a regmap. Propagate the error instead.

Fixes: 82c4be4168e2 ("PCI: j721e: Enable ACSPCIE Refclk if "ti,syscon-acspcie-proxy-ctrl" exists")
Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
---

(Accidentally bumped into this while working on BPF stuff.)

 drivers/pci/controller/cadence/pci-j721e.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
index 822602836b12..fdae51e368e0 100644
--- a/drivers/pci/controller/cadence/pci-j721e.c
+++ b/drivers/pci/controller/cadence/pci-j721e.c
@@ -334,6 +334,8 @@ static int j721e_pcie_ctrl_init(struct j721e_pcie *pcie)
 						"ti,syscon-acspcie-proxy-ctrl");
 	if (!syscon)
 		return 0;
+	if (IS_ERR(syscon))
+		return PTR_ERR(syscon);
 
 	return j721e_enable_acspcie_refclk(pcie, syscon);
 }

