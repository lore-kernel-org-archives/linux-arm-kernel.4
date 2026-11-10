Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FDF60A2601
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WTxBEGil;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fcOkm7rg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NozN7LQPNlgO67WnfUnOBfVCkgTueMz1l5T7tv+iGy4=; b=WTxBEGilYKCA4T
	I0l4fVmA2WZyb/y7PviOqIfZIZ5L9XfO/rkb4xLyf3DkTwsneqhUUDgZ2x670sb0aMh7tUnXq4+G5
	9PngCoP4ZIz8SIk9HylOjfunwj8M7eSSvRO9gliHQXzgopymFy+tpjyqZSahDK8+C5GkCWvLOGnrU
	p3zCkg+v95vcV5X78Q5m8KRODy6WZDabg9Q5cJpVPREMQ9it+Zx0tmre+MSWxxsiZshol1oM1bI9V
	780NbXZLrhM9TeO7cnxK14ANNm6VFGn7Dz6PsyxJaGTEZcxNwBVygmydoAZrQuICnRXF5NKx/NQCL
	jJzMLxx580hK/7xOfijg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdPD-00000002Nlf-03o9;
	Tue, 10 Nov 2026 04:24:23 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdP9-00000002Nk7-3MDE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:24:21 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2464863c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 20:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794284659; x=1794889459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NozN7LQPNlgO67WnfUnOBfVCkgTueMz1l5T7tv+iGy4=;
        b=fcOkm7rgfqO2p56p3atAhJAiUeueBrl8qFd7/FH4bcIEX6/3DRn7I5EugZSBOl8yWJ
         OrKDTHzRRY9MvoNKaiDv56d+/FXWe7kqs9ltlrZHlltFf25KAx1otE/oDFJqubW+FAyi
         diruQZarC+9sq/XszJnvBNDRRj0Z9gpet9ST82yFCw4N3mp+blHGStHo4px+nKs5SOLr
         KimzsNBizSaeE2T0bNEl2Mrio20ZFcNMfgKvyFxDE9+n4Ha93L1bzhLmoZyxFEzm0PQg
         r7F9KQ0M7TmiOtgUDqqk7sT4xfW4ixMUxU5ck/UyErgtomCmSJhro9lbZ0DMQ/YGcczi
         1YZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284659; x=1794889459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NozN7LQPNlgO67WnfUnOBfVCkgTueMz1l5T7tv+iGy4=;
        b=jGu7cybPapUgUlLxj4e8WQJ36ekckncCl/6tKa1ZurwU1WDqQfeLKxiwLFRVLB5qWf
         ibI1tgBpLzmuAMWLVjr0WYfMwXMqGN/PV75xnNxMiNQY4OiIQJaGf6PKQf8BX8BrZqMQ
         KN3QGk/XdYqJ87GmLWxd6u+DHu5eHUi+iF+F5ehiRmhPNbk4tPlTIxK7/s7DotUjpzq3
         lhZU+IZLnLTxtfTFUnJLdlReYfRnkxWHIWQguWAuLjyaz6ACi7y4UTZhtB2wmVc8UNJh
         0hvZYbTJPcUiIyaGw3uJXi6uPR8k+h7Wt8p2qDPzCvO99TWVFLCquF9JzvfPJmVyVu97
         gfOQ==
X-Forwarded-Encrypted: i=1; AL+hErE9wUDiQXzNwdYL0JPK+B7zYCam3Wc5jOe2XzZOslSFV+hhxmDTkRNU5Atystc4ln/5SIawvxoWGQlS1S6cCD4K@lists.infradead.org
X-Gm-Message-State: APuU4Z+QFAb7i7AT+eDaXkfIojj3dZI3RJRytAUlZdh/xrUxHiRuVz0p
	iqIL4adfl0kdcOUF940b6p/LBjRoR7sorooRxUuliSDbKqV2XoMe3U/Jz+syhfQKlw==
X-Gm-Gg: AYBFou0eT6TKZEfUvmJGqKq75LUC4GsIhtLSBnnUMfNhs4CoGwdu6We6TSdlIWFeZoM
	KY0gNGuInIVyVFORPRjaoFdfj7GNTMWnz+XhtgnI76gxLJbTlsIdXtbw9Z3sYlZYmq2ay/aWrHY
	+iVCutVk3yHpdCR5iYPp08itzuZoUVkAUgb8KJFxkHvIIZvmjsHsI/IRQN3IgzBECcM/epThFVL
	Kbq0VaIbmapDT1CVxwUnDZn980xvOD2O/m8SnPsYIn0cqJd54nMasDNz2dTSI0Zg5+Wf1C9ULQM
	FUwwM2LOFx+1O5BowgXe4YtQX8XcnZRExyz+Hq3W14btF788gVHWemFJKYF3vfTULs8P28CdnZj
	Ot5gcyoDLkWUSWExmJ0GlpeugIDljuyuFGAni4qSyRzJ1KxlRTAipGq6m9MawnNH+B/2obPkp8Y
	x36KcczZhT9uO4W5/e2TlfuM5AU6Bm688BCN4Bp3M/EIWb4fYSRWh2vxxiiZrrzlImDB1e7TVm2
	P6LZxMD+ZJRBE2U5OXsz6YgkT/N9vHas9e+X4jyKeAwA8IdBFxoW9bpHlTNoWPm96+eBmMJW36J
	UD0Wx1sfQNXIgQ5J7FfxrovlBXWTw4N0zCq6gNclcQVPz2n77sebi619Q/Dmv5GoSUCvgguQwbh
	tiKy/Ah87i1uS+tG8
X-Received: by 2002:a05:7022:1505:b0:1b3:ac53:da84 with SMTP id a92af1059eb24-1b3b603ea3cmr2230611c88.32.1794284658677;
        Mon, 09 Nov 2026 20:24:18 -0800 (PST)
Received: from cantal.lan ([58.136.75.91])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm3116950eec.8.2026.11.09.20.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:24:18 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Rahul Sharma <r-sharma3@ti.com>,
	Robert Nelson <robertcnelson@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chintan Vankar <c-vankar@ti.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 1/3] dt-bindings: mfd: syscon: add ti,am654-gtc
Date: Tue, 10 Nov 2026 11:24:01 +0700
Message-ID: <42bbc4a03679958f2ed4e195acea99fb57c68fd6.1794284248.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794284248.git.jjc@jclark.com>
References: <cover.1794284248.git.jjc@jclark.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_202419_851791_958BF673 
X-CRM114-Status: GOOD (  11.11  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a compatible for the CFG0 register frame of the Global Timebase
Counter (GTC) on TI K3 SoCs. The GTC is the system counter that the Arm
cores read as the architected counter. CFG0 holds GTC_CFG0_PUSHEVT,
which selects the counter bit that the GTC exports as its push event
output; the CPTS driver writes to that register to provide hardware
cross-timestamps.

Signed-off-by: James Clark <jjc@jclark.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 80ff0e1caca2..b1030f11b2db 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -131,6 +131,7 @@ properties:
               - ti,am625-dss-oldi-io-ctrl
               - ti,am62p-cpsw-mac-efuse
               - ti,am654-dss-oldi-io-ctrl
+              - ti,am654-gtc
               - ti,j784s4-acspcie-proxy-ctrl
               - ti,j784s4-pcie-ctrl
               - ti,keystone-pllctrl
-- 
2.56.0


