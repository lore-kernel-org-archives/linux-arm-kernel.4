Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F0660A5BC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h9XATT8t;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z08e1GTj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ihkB9FM28RtXDynQhG6sYSquSmbZ93rrnlR0/YF37d0=; b=h9XATT8twxyS7m
	y+MFDPNyrc3xs7Wb0Tz0G59O/EZLUUNQJcD3JI/+0yeG0VmemJRRbBu5JpE8+Qb8TMonJ5dJ1D0P3
	7Iku0V7qc+BeDpXlouE1d0DLqUCjQEAVfQropa+196A5KNlbkR+PeA4toj6uQ648xiQusbftCSh/c
	68sJApa4c/aMFWfFff0ohonDp3EvX5Q1Bv3NKXNFGhQ5YPZi60kzMxxX2lSLFhJMmiMBW0x06R+Gs
	5nZR8U0ka4LIyHYAIMMruZIWR7J/LTb0ctqvrYi2p8RQfBWVYq5AgtxsqKZuJBLeZhpHFrOYGuUBz
	gBLbCJqQTQ32h6rgtjxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9Z5-000000070Gx-142V;
	Wed, 11 Nov 2026 14:44:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9Yy-000000070D8-2APD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:44:37 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso34605375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 06:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794408275; x=1795013075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ihkB9FM28RtXDynQhG6sYSquSmbZ93rrnlR0/YF37d0=;
        b=z08e1GTjmiyFu1WjzvWRcPlw55OSinDL6EXhBfit8sUmlNr88nRqIIGx6RFUsgRowU
         CLcl/WGz5Sp3hXYy7QSi6bBzNVHAOREQQguO+gcTJMIPdzW9D0hQI93Xk97oDcz/wtWg
         jQJ1/yXHt95UKRrUd+HzVfpdO5F640Ex9sF7BKi2n+9tRPUq2Ac9BX9g7PiwAY5VDeZo
         ZCh/YpK8i2CLAHNHmgoGX2PDssYPQWoDFNKI73cBstZhrCHt6cIWpREAHzbLSkaP2v4z
         Noyp8MFt2LvnDUtiBQ5f36uSVNg57XEWEkgHhFe8k9ACfFkQzwnyz+/xrSwoAcwGzFBZ
         pzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408275; x=1795013075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ihkB9FM28RtXDynQhG6sYSquSmbZ93rrnlR0/YF37d0=;
        b=hGFrjJ//3UMyzGVhOvq7BwfbjfPlDW/lP/AyJBXHGw47z/sLDwY30o6GTYKgcbKZTc
         ML0wMJldtwqylph1IfmGa4LvTYzvY6ErnsGI1UrvrLmw1g9brQnysBGjCZ23iNYFziuf
         JxXzoMigaqKXTH7vRON2Y3NMMnK8FuHIA+hJIAdDNEz5nSC0ypzLnKrMN50iaIouXS1c
         jg23FLsRdW4VazhzEFggRB03d2CWTnpMI6vVzUz3lrIOQrF+0uqFwSiF/4Z/1rp10rQy
         BMjZDNtHySCi/LnyeSWpPRipq8j9kYxw30AP5lfxIHQC8wo+LZOVXiIWv/bB5mQ6iIHR
         dihA==
X-Forwarded-Encrypted: i=1; AL+hErHtngY/yHjth7uJndEeZDdFIgDG6LVtbUye8RUQSfpPHTVFFattMy71jOmCGmDj5xtZifw7JSbUFlx5CbM+CMKq@lists.infradead.org
X-Gm-Message-State: APuU4Z82Bu6i7ltQJl/8AgjeDS3k5PnaYM9TOrMmwiW1TOoLXXB9saK2
	jLuQRFyDWxuxoBGa1M0AWeNe3/8MsTTTgmD3vLaxj5OjfXcAvwEE1Lhu
X-Gm-Gg: AYBFou1a8TMR4MtepzQlUHVjwPEiG/wbYmeoVkFhALavWWcE4RxqNwOrTCNwAKTEDHr
	p30JVlVy/VDK31lCEVCxO2+cLt+ocVVWBFXJXbJKw8pPowl9BrjXscoyj7e6xbFUCx8hhJvDyrC
	DneEYpJR89UbfuzO07Q1gpl5+C/LRMBVf0xF6sRDOfDWeDga/iFkumRpFtum6/DJze6NIj2Xnvt
	XxLDUjDOjtlrOiy/z0sMSbC8oftoVHz0WcOAryA2X8fXVW6PebehMtUhj10e0bJPnef21Mk4lwf
	YK98gFjuxmrU7s+iH4cKzrFp7STTek9stLaFqgAu+bDyiyRJRr8+UakGmceaAwWVXvOnMWaERoi
	+hH4B1YZlP+fpsKL26YQnfKYoXtotNGpMmld805brOIrHtMkfxn17k8qkmcg+uospZzf3HBJaYe
	z/0DvwFrXImMpHqzIpNt4MTG2smDbZrvtMZuR21QxQ92hNBQTac2i3nRi+0OvrHgPYsbWZM8YXY
	agddmhxFZ0aforhTpZAMaSodGhhFZv+8kCyr3bgDRYAzMahxWJmweU/No8OnjwGzw54GAgwxIFE
	T8T8FxO3AyTBQn73gCdLsfGT0Lpt2tn25+E=
X-Received: by 2002:a05:600c:19d0:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4ba093aa687mr48679885e9.15.1794408274601;
        Wed, 11 Nov 2026 06:44:34 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm46656495e9.0.2026.11.11.06.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:44:32 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junyang Han <han.junyang@zte.com.cn>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 2/5] ARM: dts: zte: zx279128s: add the WLAN DMA interrupt
Date: Wed, 11 Nov 2026 15:44:23 +0100
Message-Id: <20261111144426.1321237-3-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
References: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_064436_580717_B6C3D909 
X-CRM114-Status: GOOD (  11.50  )
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

The switch's second DMA engine, the ring pair the vendor firmware uses
for offloaded WLAN flows, has its own interrupt line, GIC SPI 38.  Add
it to the ethernet node as the optional "wlan" interrupt.

Assisted-by: LLM
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 arch/arm/boot/dts/zte/zx279128s.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/zte/zx279128s.dtsi b/arch/arm/boot/dts/zte/zx279128s.dtsi
index 8896a8b06725..9ddc5ee02687 100644
--- a/arch/arm/boot/dts/zte/zx279128s.dtsi
+++ b/arch/arm/boot/dts/zte/zx279128s.dtsi
@@ -201,7 +201,9 @@ pcie1: pcie@f100000 {
 		gmac: ethernet@92000000 {
 			compatible = "zte,zx279128s-gmac";
 			reg = <0x92000000 0x400000>;
-			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tm", "wlan";
 			status = "disabled";
 
 			ethernet-ports {
-- 
2.30.2


