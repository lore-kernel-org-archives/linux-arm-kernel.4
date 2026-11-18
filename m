Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C86D606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 10:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GP+/3y+H;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Rp1ZLdtl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NjR9C+m/zvTfHbg5SMxjrHHBlgzBe0tcW4KYDDXsSd4=; b=GP+/3y+HPkESgqKb0ilxghH7g0
	IrtJDcDLOap4NNWD8MVnlUFgfBX4pnavBy5Yde3yaJ8RLR+fgTmQ2fy4BQ+JkQkSCyKqyXqOXzPQK
	vlNOYrPTue4ox00jHG2KexqRi/rCq03YyXAPF7tXCnE92FnmvNYFViq5rWl6J7BnBy1LH93I2Tleh
	lqV+bTs+6mn21p2d9KnPLbDOKmtT4jMREig7Fym8fe8T5QGwMhA044i6Bt3P0a1sRU0YFyc3p2vxO
	J4qAe9xj2pnn3wBLeR0YShvsHvUucQzD1cKj2BDrXIAQxaytm2TG3wGZmCI1J3H/7q7PIfYD5iL53
	mHxupCoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTclJ-00000008Xf9-1nD2;
	Wed, 18 Nov 2026 10:19:33 +0000
Received: from mail-pf1-x445.google.com ([2607:f8b0:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTclH-00000008XeQ-0Z1Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 10:19:32 +0000
Received: by mail-pf1-x445.google.com with SMTP id d2e1a72fcca58-8b32efd7ec4so934111b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 02:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794997170; x=1795601970; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NjR9C+m/zvTfHbg5SMxjrHHBlgzBe0tcW4KYDDXsSd4=;
        b=Rp1ZLdtl738cuFR68T/3Nnij6QBbJwsi467iFoYIFT7uaqarA/g4S3mx/Ql/T9RsGZ
         7xMRB1lgcfJsbFsNoNzwo8legrqtt55rC3il+zkR4N1kAQS1y2Zwb3Rqb28p9zbOf474
         yTyNAyxYHwKZvLILTmGubw4HlKdiua7KF7Vg6wWlper5df/B7HKH6Sw4QJoE73cHkmqQ
         ma9WhGnpvkDJhe0yFRz+civhOyZYvlN5ghruNzYZ0Yy3+behF3n2IQ2d2aLxw4RxgXf5
         SufD2cESoykmTI0wiB2JNh8+y6OmC46r7Sqha61tg1ZxmaH0WRrGEwgsaaa5uReDzQLF
         /TpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997170; x=1795601970;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NjR9C+m/zvTfHbg5SMxjrHHBlgzBe0tcW4KYDDXsSd4=;
        b=sczCrVjuXaRZ/8SLZWIB5mNruLObm/sD+eAjaHFusglt81qTZDAMkX46oFHt/FO9dW
         KkY/74hjeSrMH4GR55/wJ8tiR9dqLxRxyaCqvPTqpsxQ7RqCGQ5PzxhE70BagiGNBQGl
         1sB7zz3n+WXhNCGnflsH/Pvu9ry6c6gNJp47FnCL+LyNb8txj3yAl/gez5OnpT4rSgvx
         79OtaePtxgmSxOE735V+VoSTuoqnaDWhHYRZeLa9ntFodkUJK8Xp2cEJjxKFmalUZNBH
         iY1+S4ed7VOmRnJ75r94gVmsZuNTCU+6lj5nQZHbMwPg0OhRtsuyIl2u2WA/lOjMZBlP
         x0DQ==
X-Gm-Message-State: APuU4Z+vuQ1pBNsIkGIvwcoj2enmcAj8OxyXSwTbi6iq0sBuMzjRZXtO
	Ls/egco5OYgeVWNW9nB0AQYZBboSMZJUlmBiGmQgU+pHsjZX/AiTC5EE/qVYHL39sR+r0DqecUS
	uWUZ94+eFSVLpKXOxW5FHAYKjMw==
X-Received: from pgbd17-n1.prod.google.com ([2002:a05:6a02:64d1:10b0:cdb:596a:2134])
 (user=amitamishra job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6372:a748:b0:3dd:a197:735a with SMTP id adf61e73a8af0-3fe8adfdd60mr1941662637.51.1794997169891;
 Wed, 18 Nov 2026 02:19:29 -0800 (PST)
Date: Wed, 18 Nov 2026 10:19:12 +0000
In-Reply-To: <20261118101913.3135869-1-amitamishra@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118101913.3135869-1-amitamishra@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118101913.3135869-2-amitamishra@google.com>
Subject: [PATCH 1/2] dt-bindings: perf: arm,smmu-v3-pmcg: Allow power-domains
From: Amita Mishra <amitamishra@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	amitamishra@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_021931_172439_222B9D41 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On some SoCs, SMMUv3 Performance Monitor Counter Groups (PMCGs) reside
in switchable power domains rather than an always-on domain.

Document the optional power-domains property so that runtime power
management can manage the PMCG power state.

Signed-off-by: Amita Mishra <amitamishra@google.com>
---
 Documentation/devicetree/bindings/perf/arm,smmu-v3-pmcg.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/perf/arm,smmu-v3-pmcg.yaml b/Documentation/devicetree/bindings/perf/arm,smmu-v3-pmcg.yaml
index a4b53a6a1ebf..aea6623bb98c 100644
--- a/Documentation/devicetree/bindings/perf/arm,smmu-v3-pmcg.yaml
+++ b/Documentation/devicetree/bindings/perf/arm,smmu-v3-pmcg.yaml
@@ -36,6 +36,9 @@ properties:
 
   msi-parent: true
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.56.1.703.gf848ed807c-goog


