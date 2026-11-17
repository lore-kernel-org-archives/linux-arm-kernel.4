Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBFC606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Mm6egc4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YJtw2sHj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=W7aGstgLUF6fF7qIgrzP8vyvffLZGpRnglxzQ7CGySs=; b=4Mm6egc4IAHx5F
	/nIISNtlqAZCpN+Pj0o5mCOQCls0wAEvhLjOzM4aFsmoWS4hlqWmvfd1F81DIJ+9ANQoK8A3pRi6q
	LWOTHwQ2w7xtVpLt5c7GLMVVO1ELc6lz1bOd6jZHqCmV8BzvBuZyUNlmh8b5Pl+3hD/fW9U9R2Y88
	dyXJZr5fYol4UCJgCZqMj5lCQvBbUHjy2ZS3yjflzCvyU5vQBgD9NlYn7++8RG0iANmebTdbknCX8
	R0H+TUrG1LeEO5euDBiO6B4LdzjgTOEQAoBtYcXDcMMereLC62n3YRbSuv9RfqxOkeXNjJ9ad/WjX
	TkSwQLN5YKvOkDdKKAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMzL-00000006ZLG-1LvM;
	Tue, 17 Nov 2026 17:28:59 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMzA-00000006ZD6-1yLI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:28:51 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-4adf4431ca0so16698fac.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 09:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936528; x=1795541328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W7aGstgLUF6fF7qIgrzP8vyvffLZGpRnglxzQ7CGySs=;
        b=YJtw2sHjARt9CKvE0R7OvpUD69Ni9Zl4OFC/HNurbZmHXgBOlFdgVr+OFvSH50PTs0
         MPvGb5C7wJPnbpMssTrJP3Fd627ecrNa1ffUzirRk26VzZeo728A40UF8ULxBPwuuo9n
         j6MvRsJv7v72Hn+fHUde3T4ogbF8yXionizrQfkGhGXJCZhj87K8H9pg5VmFOoD4jfF9
         O+QT13xvIEc6WkIueOQHHYdOy3Tw/OVDefD1cTdEbev1vKZ3m6+wlAGKZDDKHKafIJRL
         4QjdBSq50VMRZO+JmhRPp/bh245AoqjZugTyIWEO2BEPlEt+ysWiWKlygUjl2hnmYwtG
         mAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936528; x=1795541328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W7aGstgLUF6fF7qIgrzP8vyvffLZGpRnglxzQ7CGySs=;
        b=0puZ8Dk3o2X2MJ5O8mZIp4Wjq1wxdDB0EOZ83N1W9GFNYv5Y8+8hplSzSrVlhnrVfL
         QAfq1sAX4Inz+PKm5kRVZNDDFBT/rTZ2ZhEeVoIoOWM6sTIO2kzdga2iBv2oeYJUuR7K
         KhS+uHRsGetJXjE6KshFfGGp7sLPujEMNOx/9uEe4kkRD5Br2DtVFmxtASh8bjaREJek
         j3ZUirdzP2b3GENAF+tomtSoKs8pAge9FFto3Nq1o2PWwV3vMKPhaYh4wnNZMpSn+TXF
         r8bo7VoTcmaHoslLzbfHAQDdZwxEmOAMZ7yo47uj8pC4C2e2Fplp4W/hq7R7W3IceCxa
         7O/A==
X-Forwarded-Encrypted: i=1; AL+hErHSK10VMDRosEVZ5EQxVV1k/d623JaAkP9dmbSY5hZRmZwLNVvQr7OquPEw1Yar6okeii+tn0fsozd7V6+xI3Xo@lists.infradead.org
X-Gm-Message-State: APuU4Z8CSgU9odwdpmIThlvWFTRgRfC7cNk31+lxMjJ8qgLeqCN5p/0G
	HRfz9pMgl9zF/bnB+VULmNn9+AgxIuW9vaxRSAOUDP26aeoX4yWu2O71Kkb3XsMs
X-Gm-Gg: AYBFou15OqZVQqtoJuqh77F6TF76lOuY+kH7YAws717BS/h3Bt78LYNU1gQLVb4NzQn
	f4+GPmXfDBBAIJoA39fqo6IP8UP42eSS0imfeEbRztDRPEu+3aEjKDz2JzP7P6g9oh0MiF/QLnc
	Ap5YJD0XByXV4Lk8+WrWRGAC/TmE8jcRnE+C55NzGKqrHTKqO6nnJlprIZn0QFA8vSO1FslC67s
	gFA3khNIbvqafQPcht6QWIvSykm4s+9bTVye1rK6YkI0+gxX6UlVCTvZ70TTPNNgotXfU6VzLu5
	wgueNW3qQh+Om1myRDsvluzzhQ/zWVYjpIw2Fi5Acn/lTKECB+UWxPqrnfbweIqDsVOJRwQwz1i
	42VzziA3sW0udj9uM8DTrXOxK+e0k+4Elon7W326dSVlnRPc9ohh5iTq3tQO2pNWNL4BneDI55U
	IVjYihXiBPo0f7effmgs+hAuI5owhNEyAc6HQdGNHCjLrr37PzYPstClpYO6g3l94CVaI4CRQBh
	bRY9R1M8h/CSLVYUzknYAvHW5YbjKtX6Fv5NtudH7RxbthclIdaE6MdH7mb60DOaus219w0hiR8
	a6s16cIpIo39woFUwjVxduAKFS2aHQ==
X-Received: by 2002:a05:6871:2e87:b0:491:88f1:f3aa with SMTP id 586e51a60fabf-4afdf3ea53dmr11909331fac.26.1794936527583;
        Tue, 17 Nov 2026 09:28:47 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b70d5b1c64sm148358fac.14.2026.11.17.09.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:28:47 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	shawn.lin@rock-chips.com,
	diederik@cknow-tech.com,
	michael.riesch@collabora.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	daniel.lezcano@kernel.org,
	tglx@kernel.org,
	detlev.casanova@collabora.com,
	maz@kernel.org,
	david@ixit.cz,
	Chris Morgan <macromorgan@hotmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V2 1/2] dt-bindings: timer: rockchip: Add rk3568 compatible
Date: Tue, 17 Nov 2026 11:28:41 -0600
Message-ID: <20261117172842.65346-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117172842.65346-1-macroalpha82@gmail.com>
References: <20261117172842.65346-1-macroalpha82@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_092848_516271_B16AFB5C 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chris Morgan <macromorgan@hotmail.com>

Add compatible string for Rockchip RK3568 timer.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
index 6d0eb0014eee..b245a3051d66 100644
--- a/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/rockchip,rk-timer.yaml
@@ -24,6 +24,7 @@ properties:
               - rockchip,rk3228-timer
               - rockchip,rk3229-timer
               - rockchip,rk3368-timer
+              - rockchip,rk3568-timer
               - rockchip,rk3576-timer
               - rockchip,rk3588-timer
               - rockchip,px30-timer
-- 
2.53.0


