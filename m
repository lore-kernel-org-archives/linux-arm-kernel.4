Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9888606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CFur/Oj6;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=njEtOBqm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UVK4cLpPIwtEhsLblH7lP2xDsWsx2AvOU7sAlFHXFUs=; b=CFur/Oj6EfjkSCoG5h6YxW6maa
	R05TVNmCp+p+iSFEGezEvflxGKMeBoB084hhnzH/pvwjcFvBdRmWqI7eyPBWVqsC4NoN9YR/W+iMz
	FvSbwyd7rCcKFsfnh8MbNYBxrpj0KyUxsS2cExq2ifCsUG18d45bo/ZTl+stX3IeM+oKdEPI8Vo8B
	IQ0uFxNQEzqm55IiPRcxm92EMX4ZmiRL34Q2GMcpXgYuNBHT9HnUuaAZeh4lu89MwDIcHp8doi0xH
	Q7nCRI2HEprh51xTWJ3jyjc9cUp6IF4rzjOhpghh/n3GcdMJEpvpzXJlbvJ2CxA44ntDID7v76ZEw
	ZDLO2Ehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCxH-00000009yRc-1YOH;
	Wed, 25 Nov 2026 13:22:35 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCxB-00000009yPp-2KVC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:22:32 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so3946880f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 05:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795612948; x=1796217748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UVK4cLpPIwtEhsLblH7lP2xDsWsx2AvOU7sAlFHXFUs=;
        b=njEtOBqm5Bnz52Gl6BV5KdncyGrhuYeRLB8/1PtuW1ZQuaQOqYr9ZDNEU/8sbbOyLt
         OaBiLIfY0lpdsloRDv2qGrFU55e5keBpb3T0ThV9cjgvdaEiLqXo61iZ1+dcrsJc2MGU
         xza9Dt4FpcwgYvNFGgxuqKnh2MNiBVDNdb2J/3tAIJOAAHxG208klDQ9gP6bwYnRV+8s
         ttgFgz7a4jCShHUj8imnIJFaxe3EZ5s9zai2mY3Bv1sfWslM0BERE6mIZ+nUoCKYG7Mr
         pf2LwXc9xJqgIyl6hxiz3mSZQSPBqwkxD14nLxBWcG/tPNWoi54+C6SvcI142tOdvmMR
         6MDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612948; x=1796217748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UVK4cLpPIwtEhsLblH7lP2xDsWsx2AvOU7sAlFHXFUs=;
        b=ChMLSLsDSKPA/IS6aPC3bK21GtK4aIwA9yNpWuxkz5Wll7BW4xtVTOEqDa142n3OPv
         +k8K59ltreDT3cLd0983E3rZgngBpdZHSBB7xFIL0PL2PVL1ytC1VWxU9h9/jPcW4LV9
         BnarmAxbqCtsbuVOB0m16/Ivt0ddicv+uAv+cm0cDMJGdnLwFTtD/NEZjFoQE9hVowgF
         OSBV0F+i97ifwfRoH6gqZk7sSRicU2UlOLvfMmhXhjLdzmQmv21TZSkIwAjHv93n0tr0
         PCJE/QV+1f4R/CiXoQU6VRmJuDmNod1hBjySul8FBKQtYqz8yluxpMwCT7IdB+WNoby0
         XyYw==
X-Forwarded-Encrypted: i=1; AL+hErEQ3lL8B53FjCD9wrgD/4ipiaqgmzjvsYP+SuPbXIRLKfUK4cbW5oi56CrLEpFbVzhmyG8YpvrzSILsHebjGMZq@lists.infradead.org
X-Gm-Message-State: APuU4Z9CApy2rncx6BEL9cSx2+MSQdtiCMqeWYR6Gn+/Tk9ZRcMB3IxS
	kgq7ClDvCpKeW5giUl2lT4LAclko9wv5zuyZhkNDYiZ7HXQer9BaiX+X8yhrbmQ5fT8QzqOA5Rs
	EEJMbckn8Lg==
X-Gm-Gg: AZFdTZeT7IIaM/IcSrxThgjQMswI6YIecPN4dGhCBrq7SR/k5ILYyAn8q72ML9l7yJW
	VG8nqp2weGRx1oSkIwmqyuWpG7W6rUHHuwP6Hdt+nh0XG4PcmuW1w0LYItAlghj8/qDte1OUotp
	T75SAKaeL17MMvpjzCGy36JpPqfctgnfkbMLYbvO2Ixr+4uF5ZmeU0pEN9j0YKnuIAKhOfojbmn
	Ofz7gynulG9azi6xr0kU6DwyG7O7qvFnAT1yPHTf2nhAy7ZH1FRebwGrkf9CR6Vjm6X3uzbwVpW
	EVsS1OLQyJOU+BaMaNL2AuvYbDqyF4cfHLpUFKPYw/Bbj03ZRMUN3C6MiI8SlMHl8bTUlpw2tEb
	HuQ69zK8KK8QY5/F4Jh8Roja0jg/c8Iz7eZXNDPYgP6IbbFzTWS1vPE6CLClRDXCPJ7ZkR3Er+G
	vq9kF7Ci8pxZmEFCGcvSGMCt4CuYDvQyGVkAz1dRNUQFCMOKuALYuih/YgIcdZ0bO8KxQFYT5Kf
	NOV1+KhGHLYRVQrdzlbNZNxsJ6KNEAY5yqGEfX504TO7WVrL+3NW0q+bzueLyohhpyNIq1OYG25
	6tWrwrITu4R+hybnaLw8/hTH1/a97T4xlJ26Fz/HvUyr3eJlWlEzVtsNR+F96yqSdPb0N0le3/O
	spWvLdeOmfVL0
X-Received: by 2002:a05:6000:29c6:b0:4a6:56b1:cfc9 with SMTP id ffacd0b85a97d-4abb41f4e0cmr26210426f8f.22.1795612947363;
        Wed, 25 Nov 2026 05:22:27 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm34944259f8f.53.2026.11.25.05.22.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 05:22:27 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: mfd: st,stm32-lptimer: add resets
Date: Wed, 25 Nov 2026 14:22:25 +0100
Message-ID: <20261125132225.90891-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_052231_194510_9D4BAA13 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 2.2 (++)
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

The RCC has a reset line per LPTIM. The STM32H7 errata (ES0445, 2.17.1)
advise resetting an LPTIM through the RCC rather than clearing its
ENABLE bit, which may leave its interrupt stuck and keep the device out
of Stop. Allow a reset.

PebbleOS, whose STM32H747 port uses an LPTIM of each core as its system
timer, describes and uses these resets.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
index 4eabafb8079d..412060d3f167 100644
--- a/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stm32-lptimer.yaml
@@ -41,6 +41,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   "#address-cells":
     const: 1
 
-- 
2.45.2


