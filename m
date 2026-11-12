Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F9D606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 07:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O3nzg8TA;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rQ7XbaD2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZQvD44KeZjr+VzuppKySH8R2T6zUJQt89oLFes9hTD0=; b=O3nzg8TAvzulVv
	RyPwVSBF9f0QvMV9Mp+CvW0HjJavq5Yi3896KL9DvGtAaRjbmkuKRai9iICi9WUJ8oFGgKi/u4HtU
	ySMcPrPXWxPa+6qLFJij9/0BZAi/sdaamq3rdkTKTfql7sDXWpxvN7Oo1Y6u+CeZv/kk5gijmNGll
	InPzeB7zgdP7xCD9Le4rnsRp9HAr79b77vbje7lOg9rAJJd9cSKAF+QDrQN4JiFZDSmDuCxsu/ZEe
	qT8K4AvgcMB+x6l+WMc1d+rM2HKbkXDTaOKDUReF+cmRTJHApC6/sdmXaka2Zh6yNTGzMNLhaQbte
	6g7K1NjZD64Kvh58xwHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPFz-00000008vvD-1Vww;
	Thu, 12 Nov 2026 07:30:03 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPFu-00000008vtZ-20BD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 07:30:02 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so33983945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 23:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794468596; x=1795073396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQvD44KeZjr+VzuppKySH8R2T6zUJQt89oLFes9hTD0=;
        b=rQ7XbaD2AFtzeakOKcZLdhUFN6qmF++5WNmpsEHZ2YO+68soSmfXX7WKByhbiOOGdX
         lNH88bVD9UzN8qEa4XwyBa2DaFP4LkZqm1aF54o75L22rSx/WY/vU18m7XjExmp5UwLV
         f/Vv8PKBYwI0QnqdVUI0XWoQsOPt2oNj327mNEBzZSL7Zi84Nlgmdb8XusQMOop5ayWf
         lSnk7NMf4sqg/E9PPxwyuIw4z8olIHH9gznqdr+zyKcV3LvmWPxlDsc8jwC1dvWbmFqB
         fO6nBCpf0tGXfpdUOcSxM6A05nyj52f+gccEoq+myKspkJYhCPk1dv/6llR562/vv3XM
         4tGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468596; x=1795073396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQvD44KeZjr+VzuppKySH8R2T6zUJQt89oLFes9hTD0=;
        b=itc3Vl+vkx67furQ346K9i/jLFEhjuCM1smElIkHqLdEYynTWeoyNeNvY8stEvlSAi
         GkxHtQHBlUBCu7yePlsOY8AIohazlbfxDBF8DSx3lzwm41lg9xl1VwIYCOqqhjqbRfBo
         4ZByhzZp4R9d8yxY9faF0qB0Uy7i10ACUhM3iKCxEppacjCjVQEbKwynliaZHw69KOGV
         9uFFJgs+hg5MLamZGfflvqBa/cEeeCSd5bNCqo+IBIedOy9szr7N8K1/ErF8UNix9Ni8
         QtZcW5sCAObS0Kb0kOS06Zx/BWfqkm6ybDrbbStoKm9+tx+MSubcHKe9MAcv4lcmFQ3y
         U7xw==
X-Gm-Message-State: APuU4Z/4sf66CPfqd1DX+ejudo6DTJvZ+Cj9mURdP3rq5rYn2bOqbDP9
	xaqz9T5MJJGE3uImTVWJVhnzS4mgOFtcZg+j6zkhkxsDvJMYLJMEn8Ov
X-Gm-Gg: AYBFou00b9Pjcqab6UcryhBCJLhlruh1FXr05uJ7ywE8MSOgHDxTgbMLvgIy55k2B+y
	cQwid5Nw9d46fNAUj1AFgmHKnFgjYKECEewNUl2DfpWTUp+FEX2Ib+F2J4ZH2xvnBu57vwEeSIH
	u1tTYP6T/8eJfW2/AZoOH/66PgbSpuig6c8bYp/2LjH7UusOw0DzZZdcFvFmKHZNr+VgPm4wMto
	GZtz63kBLG5dKI2BtKqhRwHEo2S8uzj//Jmmf5j5cAaWxq7qfmoCCvdXGHenLMjZIUW5njuiUW7
	UNvEquEa0rBFxLjbJBjFp50oiwkNQoOc2lW6n+tOKRE97Xi5nOoth/7bGn1QGCuaDGrO0iDJ3US
	gMiUgYfTSAVGrp4Y1Q7PUOMC4AQzb+ij0I8SuWM4ppkFoXV6z9N8vhZHPAzUEcwSK927IdNJduZ
	BGcpb8TfKwkGXgnAf3XZg67FRWWnhyWbjkYiZCw/JVPsmW4StnzaIRtD1y+Dc0/3lIGMGamQPO2
	WMY8ay+YLwRuXshoDkzv5LYflTOv0piV1IAUyqkmcZK8b6ix30wLO3ijjha8HJ8nzPzpfAf9FsE
	tVe1FvzP7/Y6dW91TVNvTz/jaTxg5SDvPl8cx+4zj9YbT7xhAzQocXeW
X-Received: by 2002:a05:600c:4e41:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4ba09383c0fmr77333275e9.33.1794468596348;
        Wed, 11 Nov 2026 23:29:56 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0951bf2asm81897575e9.4.2026.11.11.23.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:29:55 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: cache: l2c2x0: a disabled node is left to the firmware
Date: Thu, 12 Nov 2026 08:29:52 +0100
Message-Id: <20261112072953.989664-2-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261112072953.989664-1-isasmendi.agus@gmail.com>
References: <20261112072953.989664-1-isasmendi.agus@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_232958_776210_AE751669 
X-CRM114-Status: GOOD (  12.80  )
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

l2x0_of_init() is about to honour status = "disabled" on the L2 cache
node by leaving the controller alone.  Say that the firmware must then
leave the cache disabled: the kernel does not check or change its state.

Assisted-by: LLM
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 Documentation/devicetree/bindings/cache/l2c2x0.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/l2c2x0.yaml b/Documentation/devicetree/bindings/cache/l2c2x0.yaml
index ee604117ffb3..15b5d8c1ebdf 100644
--- a/Documentation/devicetree/bindings/cache/l2c2x0.yaml
+++ b/Documentation/devicetree/bindings/cache/l2c2x0.yaml
@@ -24,6 +24,9 @@ description: |+
     early secure boot code. Thus no need to deal with their configuration
     in the kernel at all.
 
+  Note 2: A node with status = "disabled" is not touched by the kernel at
+    all: the firmware must leave the cache disabled.
+
 allOf:
   - $ref: /schemas/cache-controller.yaml#
 
-- 
2.30.2


