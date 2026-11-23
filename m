Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5881606A332
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TiQRbmhQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vPav3Je7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/dhg4VNb7Bf6y22l9FV1//VBS5m2KJB8FreMv5POxa0=; b=TiQRbmhQRRkGAy
	707AXPUgpkJG4dO1BoUINVCowwBrrp+O2PoGd42QMLdEHXbOWp2LrWoOTUHZgNdEDAWbdLUsObvuL
	wq10s/x8MNYWnUxWVL+ItmPHaRL0rJHX+sfAq6auaQSHe1qDMXLahJmyp3V+qkAtQxNSuFEcqS6lI
	RiW9F/kt6Wl7bxj1hBRi8W+0cVLrdkuMuDLRxts3UPOLe/TS0/ImZOa8aJRjR5Wu2WBnvFvPp7anE
	7v8izp+Gm4Kc3W5ZHoHqSLPWn8R3SO9WEhu3Kpm2L/JGkL/MnuG8zPp+6Z9OnUcaPN055dwkhQgPH
	6NM1XSF7e0+2kLtmJ8AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVY4A-00000004P2Q-1d8A;
	Mon, 23 Nov 2026 17:42:58 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVY3w-00000004OyX-2bQ0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:42:46 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-86103aaac12so2578605a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 09:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455764; x=1796060564; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/dhg4VNb7Bf6y22l9FV1//VBS5m2KJB8FreMv5POxa0=;
        b=vPav3Je7a7i1uENnz8ltvnTe/r240jhvqYW137zE6lyO6RVWW7kJDlRNTIG+tEY4wO
         L61n/BVcPrgkg+iRyhg87DQ4nXPAOm+U0uDHApAi3HguG4NFpi9Yo2V+rNmGnuxfZCrn
         gPJVLHPxN8AXKkbdoVN1vXCCjid0Q+RjK0KhzyPZgwpdK8LxtyAwf14OO7/KAXUH163W
         WHcmo7Co4x/m02zjyYyz9ubqnQqamO3iVd2aP1HVcYB1Tz6mYZ6p7YHNNcW/HbpM84i4
         8tHYkLJxNgZ77jVTM360RehpeywWP5Uq08GKkl8AkwEdbOxI/Fpd/2tEmF91cfBt2pzI
         z9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455764; x=1796060564;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dhg4VNb7Bf6y22l9FV1//VBS5m2KJB8FreMv5POxa0=;
        b=yiIXuSfMvJxX1S6y3cGKbVIWHbYtf5K2r9C83m+rcDari//HNLPbY2Suw0gpjTplt6
         U7fq+rY2UskwaiMNq6S5jZlUEnwLPv4tR2yXJajCVAM0OG4I8Xk18ayfv0u0jNEsIgZz
         8aaEyPP2c+DaliOrBsz9OWhyeYM4e6tra7W5TGXJi2z4eZd6sRPvFRLn5n0jfFQlFXmM
         OTldNOsuKPYre5/gSRyXBCmzFe5nFAhhdbpalCbJRGtr28ExKIKn/rTokFkmPhIS16Bu
         BVZFUkG4SeLaW/5dPueSSVvn9DVy80Qd7XU6A/BlcHIgXcT99vt7l1JP/k6RwmMOdmxU
         glVQ==
X-Forwarded-Encrypted: i=1; AL+hErEEwFa364X2xeGcdatgVzSWWlZny7NlEyiTrLbWJkY3H2u+DPaRYpH/XjJjbpd8PnyB4BVAjp+lVctbN+NU0ut+@lists.infradead.org
X-Gm-Message-State: APuU4Z9acdQB/AoDKgxOMnDX4efrqB+bxuYJ80kdrSqt/+n6Db+vHODo
	zm71oCqrTRLelfgeyvDJAsPONteYGOh50Y2LyF5JWSZZHdTgwpdKxqVO
X-Gm-Gg: AZFdTZfrh9o339VYr+Bp4gARL21iuCwj02Sq4j3o9uIUOcb+sf76trt/GUpg3TT0mv9
	D6ZQSBAK0Yws9ElNBusM5KxVh3kxmpeYLwWnhQoQwCht/Six3DY4JuuzxH9YhTiVxKt5BJUkvsc
	vZWVhiUbmF5yI+DM+MVO66m5FldiM5fP8h7mSkUyE+lgn5UbhKYKVH+HA/D44bA5smSf5tCcc2c
	xL/up3/G7f0aCQcmVMma5fjlqBfl5sV6hbARQQ+lhIGQiDieFwSQuo744is+lg/FEaL3/iFksvw
	/kzNmNeHFPjZcEVpZMPcTzGWXAOe5rqfa6nyTBpKFPBIk/SO8/kHkVYMOoUCk2x7IxwSNZl8K3n
	amPxwi3zjE+vsriega/T4jADQeIqYs/spfwYmFRj+MhbFNTyQDjpDZ9azzxUZkcDOxiGxv8Ts/I
	Ju6AR59DUNX8yraLXJ/SGGuzf2IKdsaxURDJseCUoCdw5ZtxIM1kWEatALxFNUFarH/FZOLPotT
	XThz6JN4om0YTMO8T3+H8e9DkUW1uuBkJkPwdAIX+d7G23udpww6mP8FKSLgEnxZic/sbbXnJ5o
	K4jot8+fzmtvYdraz/l9GpQZLrFR+ScvSAon8R7gBzBFty9gijeGvnvKbMh5gnQPKmVZSh+N78B
	BXeO4
X-Received: by 2002:a05:6820:2204:b0:71a:e0db:7131 with SMTP id 006d021491bc7-71b327d5b77mr9724862eaf.63.1795455763890;
        Mon, 23 Nov 2026 09:42:43 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631692d9f7sm9343058a34.24.2026.11.23.09.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:42:43 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Mon, 23 Nov 2026 12:42:42 -0500
Message-ID: <20261121-a733-dt-v4-1-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122004008.0ee8e16d@ryzen.lan>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com> <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com> <20261122004008.0ee8e16d@ryzen.lan>
Content-Type: text/plain; charset="us-ascii"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_094244_751405_CD624662 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Can you please add the A7A and name as well? I will send the .dts
> patch shortly, but having the name ready would reduce the churn and
> avoid conflicts.

I added "radxa,cubie-a7a", "allwinner,sun60i-a733". Both strings
are in Radxa's Linux 5.15 Cubie A7A board DTS. Please let me know if
your DTS uses a different compatible.

https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38be8d3c1ee851019795/configs/cubie_a7a/linux-5.15/board.dts#L5-L9

Enzo

