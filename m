Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A122606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mq2eeHO1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=to3AlWf8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EI4oW8pj7RcZs8NTrnTJQwYJ6BNsBnrroZ1HQMORju0=; b=mq2eeHO1R/J6It
	KcyTWI00aKxObAqBNd9q8SwQRp3lZBugzG1rEoNKkOP/77a5yODKZKYPixLGNPvs3/D5gi9qdDjDj
	IVEkZ62vvj8Uya190rtsCnhXW4by2VdAna/5wj5IpOAnj6wrdohb7hpuonG4DoIzg6XOIvMiXWYbj
	X+tJFbmDsyG3rhKdobayQVEbae+zl1uf0kSGjvChH7hbK8BtZew/aobCHCZfsDPLTFITFdRPLPGT4
	9E7u7aVfbF1CJQS4MKA0Ix0AL64CI2mFbtbUJmxkwcJkjFL+/oGL08Ko0GDN+FDlfuZR9tvodn1DO
	9b3k5a3M+Ac9Y9I/TKgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxx9-0000000BGu4-2INF;
	Thu, 19 Nov 2026 08:57:11 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvu-0000000BG0m-36tr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:55:58 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-55c304f7031so9284851cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078554; x=1795683354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EI4oW8pj7RcZs8NTrnTJQwYJ6BNsBnrroZ1HQMORju0=;
        b=to3AlWf8qMaQ3/Tib9AJEd6AywYF+CDaFz0u/2O1yJeCbbW7nc+pO7ln+qjidbB+Aa
         RrWwW6EhpkcuF5Qt596+fbECAvEGjBwL8AsdqK94z57HSbJrHzdSb0Mbzc5+mbVqSHzK
         OY6YVcxoZiYC4e/IulEUdbbBAAsGBwZ2XGgsVClQ1KT10qF0uCMGQfWOZvjxfKZDLuGC
         0mdqEnCmwzH+8a44O/z91xDvFnv0VzKQYVO5Ss6yJuqjc6pMJPrCcZVXBNzQFqK/aZNJ
         mFIl4uHAA4neJBXWMMaKy5ugxYanMVIFkgOwUJGNP1JxXkZF/JPPC37lvrmmS4ZrOv5H
         0i8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078554; x=1795683354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EI4oW8pj7RcZs8NTrnTJQwYJ6BNsBnrroZ1HQMORju0=;
        b=PDsxKkX1i9ipTM1fClhcZxPS6FcVvs+yJVlVcGGn/Ir7ow+AoZgzAPI8jsVlVIDtJ2
         nMfosTj5eLxEKTbhPF8IbMo2vbXoe8g2z80sgvtNHb7BF4T29eX7DsiK4A20825FpJFX
         oKYZgeWdbdtEPzdYs6vjBFrM7M6eovVMsNQpoccVouglYb0htEuYYK+fgX7uFGXo3jd2
         MVWKV6txprw+ebyd4OoNaW/Z6DOFyH/sXpx4euKRHA+iFz6AgGA8s7i33diOkDAGpq7D
         Pjyb2q7qDKGsCKroqeZEYvfIW9fpPtDi8c/hiJ/JP12xvBaqKBdE1zu3ptcTS1bxsnKB
         AgXQ==
X-Forwarded-Encrypted: i=1; AL+hErEFkKrUMHz3PvbWl5nJ3wqPwI4zLQJjzS/8I/ly31rDlHrId9zXWWElejcQpp7tuYJ6voUMZl85xbdhHnKqSbt+@lists.infradead.org
X-Gm-Message-State: APuU4Z9M4TaHzNGZOpgHyYQ3qaZ4PNTP3uoWWPx7PyRQjy8YxJT/a3P6
	cy6QE/b/CAOg1VOETKNtyhblN6BJhPKVX+ev9AzLJCPxDG5r01MJJ+iS6uXP5A==
X-Gm-Gg: AYBFou3VwgPSRXXGhHvk+zawlYUNNgbC9me8RXmlXAmVyFv4K66+y19A5hSfYBX4n37
	SZm7//F88K74I8oyTUuZICntdGbF8ggspPdZzGzKyotI3V1jtzfWkz/U3F6QJG09LcAnCfFrSD3
	ZMBn5wmubXcYwJi42nlRlGykJ2IzsZhdP5GT2UtNJ5pnim5DLX5euetbWsdVDTNuKu39NPKW2qi
	E2dFf8KyBR7ESNdxRdN/gX/g0FXFS2BinVQ/iaHmyBB9rg7k0LaMWQNS0xd7sHVnCwhrRfgNcxh
	08fds2h+gToLUit+CEEm1pEHf8OdTeQF9ZI1o1rJAr/W7YKl/xeR8P/48kCeOUS3r/lLi/xRvLL
	uFFgwpDrHUkC9UMEmTtg6+oRTjwb3eRewsQgxsm4xwArxWBz6v+InYxoDMz+8q/CcM3+O8DAdPq
	h6Lst9E5/gFWXnGjdjr8FkiU0JBiO0DMMSah5smiX8NlzgGYOwnlmuunvSjfZ6anHFsDDu8nok6
	NeLNG2Co0lYhZ3TtTKXc71ywe/xAvgnT8mUG0mlngdSiGQFtV1q9CkL5HNL6T8dEGpoqbDHRSPt
	3jWjYVDmo4ZfXatiy9lhUmfmaBFuzrdHPHn06YYQJM2VhL/WMKflc6sCKUiUje9DEge/H/5u/Qx
	NtSg3QNPdm9FpkBmOtK76pwyYdxdD/IjuMrZpfhyjeEq1Z4s9Uq3L9hTV2rJHh8HGBRbjPChRLN
	aJJiaKu80Y+JnNwhd0OT+sdVkF
X-Received: by 2002:a05:622a:40d:b0:536:48e4:680f with SMTP id d75a77b69052e-55d6fc8839amr5194821cf.30.1795078553644;
        Thu, 19 Nov 2026 00:55:53 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:53 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 20/22] ARM: dts: BCM5301X: DIR-885L: use gmac2
Date: Thu, 19 Nov 2026 00:54:50 -0800
Message-ID: <20261119085452.75708-21-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_005554_787895_36C259A1 
X-CRM114-Status: GOOD (  11.80  )
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

Commit 473baeab9294 ("ARM: dts: BCM5301X: Explicitly disable unused
switch CPU ports") left port 8 as the only CPU port, and port 8 connects
to gmac2. The MAC address from nvram is still assigned to gmac0, which no
enabled CPU port uses. It is also the et2macaddr cell, which belongs to
gmac2 by name.

Assign it to gmac2 instead.

Fixes: 473baeab9294 ("ARM: dts: BCM5301X: Explicitly disable unused switch CPU ports")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
index c5099defe9f9..b64ba9afa736 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
@@ -121,7 +121,7 @@ &usb3 {
 	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et2macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
-- 
2.56.1


