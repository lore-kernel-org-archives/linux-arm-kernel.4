Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE1C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KgEoB2yA;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F0y3FRuj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EI4oW8pj7RcZs8NTrnTJQwYJ6BNsBnrroZ1HQMORju0=; b=KgEoB2yACMTZRO
	uem2Mq2y0BS8dwADeSfMN0lGZnxLinbDsx1owDPz+iwWLa7Cwj+hNdUFE3CViQMuBBMAZ9fOu8S1U
	5mbWAxrBbnohuH/xU6/y/heg3cLRI/TLm+40xAR3O3qhdaZn7iDp2/tq+94w68bvTx4yeJfj/i0qU
	LLbeefZwjbZcnU63wF0v81Nm3rOf2R7ONmyXzEK1m49KLKIjAXfp2qK0q5/6tvkwqFhZTiMoDjH9O
	/fjLrOzF8rxdsh7Sz/mk/NxTa4PLgj7hypXXkbmtEIkvzzFMHG60BUCrWSeYTZjHUn1i8zQHmIGis
	z28je8UPcpEXYQeETQwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYXX-00000007m3z-03Qt;
	Wed, 18 Nov 2026 05:49:03 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYX3-00000007lhP-1OMa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:48:34 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-3282db206d3so1725637eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980912; x=1795585712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EI4oW8pj7RcZs8NTrnTJQwYJ6BNsBnrroZ1HQMORju0=;
        b=F0y3FRujT6kqzK0kdHf6gUxQjc813GcttUjCiAbyv619QCheYXgcdAY5VWxg/lfoA2
         R0mgM5JOX7VOJATSRpEByl/iDn/VEbCEugNR2ro2DWhInAF7QBkCTI6Vi/26+S1SeoCS
         gxZLiMA/NT7VGEsPgMNShJuV2sz7B0/oGTM1LPNBKn+nQTLx6UgkuXZPduWIy/nEAFw5
         aJvBoNmTA2Tg81D+59K/1XmgSjQhUtX+kSpTkzdl/E/EyOWRwuGzhxRO/9BqjbhniId0
         8TQ3mCVWKO8jlmTL2cL3eUjzfYXQs442OmAwUqje61ajDNcU3zcCTzzbva68j2CdJLF9
         SvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980912; x=1795585712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EI4oW8pj7RcZs8NTrnTJQwYJ6BNsBnrroZ1HQMORju0=;
        b=McuBpI8TY1VXCY5XfsnhB7X/xc45i8cA+Ps7OGzN973FVow/M5GJ8FjluqwlR9DjvG
         wuy/slF5DysS8IO0crRf3FqyGRbwJfyFxVje3OD6EzFYmuFaXENF7m4Z+AV87fhGemw1
         MYzxj3QAyetR+hALnVTiI9x96S0X3fEocgUHsHdl7fj7UzmbcLyYNpeeYIDdsbxTl011
         yDZ/NYNpOqxiYMbvAp8vX5rDaxTesx/5orHOdvc5kx33JUTPI5Alv2ZlL0IedRU+n4PX
         dGkrjzYTL1FZT8/CwMShlPF9gb6sg/JzOXNZsYwAHKStsI66Ddi7g7qPO4DDDtiGdg+x
         qHjA==
X-Forwarded-Encrypted: i=1; AL+hErE+QZ/FKCtKt25brLufgTZLwoK/eaCYzfKulmY6DXQaDRR+upmUteYDBBdljf5RgylAm95vlZROGd3vtN56z4sk@lists.infradead.org
X-Gm-Message-State: APuU4Z8FQVEuBOgNxE/tmRRO6aIbQfGtB4VhpgKI5Wy9XaRQcmy76UwS
	TPSIogVFzOcZjYNJr1jO0JeJt9ck6kdwVCiTElIf9ALvW03wdUYyhGuH
X-Gm-Gg: AZFdTZeg1Hrm/rhGXhRvSJID/YsFBuFQF8HmAdiA/oK+PzO4Nx9ykkDp/1cLOlRkyAY
	X8/KPIOnKJ3HxXutR7U5Ub6JBsLc6xLLIP5x3SsB0ly/xENvmuhF2WyzJ9L1XiS5+XYv4nIOOQf
	eCMICYF1l/feKtrolv+Vm7+lX5reJjidVcvGLRhhqlhG9zNlOM2cKi5Lp/KxL4/GwihjYKx6KGQ
	THwJhsLhZpPKhoOFpX6Iok5nPN5DRAyi2V7MYxu/rKAqZZ82ttkW/pYAM1Pc5ddbXLKcOEuKSDc
	Bk2qXhLg0P65mDuqGNTOmRZusK55PT+aJXWvCJvvgT2O6aDE2GNWnH+7FEoKzoSqV7DbE0enew/
	R96HMer2h+zvIiTy0nUqw+Kl8k0pB/DzrcAY91tZNn0iyqYv96nMiwRdw2dQCbXkr90fQQ9NCmA
	J5xzV6b76lt3wuzX3Pddx6+1kN7Kj0UVsWRdy1JrN6KbCs5vYotnTDQj0iyke3/phkXHyhLJb8q
	U69bewh+dQtD9unshDJKdbQM8XiGFtYNWXG8WXz08EpHwFai8DWxfBEpn4PyX20pAhXMs0F0FER
	KPb9cq/Rmo1dNoG1NKMBV5LvZgx3gSNMle94W4OlQ3w2ozP168AbaoZesMRP3zP1ekGq/AV+gQ9
	YiK6UnG3PWzZP7csnsFDzrMjdDZipaQGdolI0P5PVRZpzDiEwQ2QkBCI/CmBbsvTtioWLtJxY42
	ZXXw==
X-Received: by 2002:a05:7301:4682:b0:36a:437a:4c00 with SMTP id 5a478bee46e88-382803787b6mr1672364eec.24.1794980912552;
        Tue, 17 Nov 2026 21:48:32 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:32 -0800 (PST)
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
Subject: [PATCH 11/17] ARM: dts: BCM5301X: DIR-885L: use gmac2
Date: Tue, 17 Nov 2026 21:47:52 -0800
Message-ID: <20261118054758.132233-12-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_214833_415761_8A44EAD2 
X-CRM114-Status: GOOD (  11.69  )
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


