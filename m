Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8905606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 20:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZwWEITrz;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FJLnbjyU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7+VP2e4/Jx1gpeLV32IskoHLYhFefIx3VrQoyhcc2vQ=; b=ZwWEITrzths2zURMljdCCQsPut
	LGqsTfbNN/UhstlyOVSLymFBpL7Sh9uCcd3YFWvYmk7NKn5kAGbKtglf+LuSRuUK9u6hCl5zSjJQj
	omgkyvDZXI7t/+6YrYngzH0i6LDqmqnW1ezKGW2wzIdnnoYthNsbEp+iLW8H2mJZ6MnVQCKEUXf1y
	uPd4r2LZRG+tMYcjFaou3mMUXCbsp9XIx8O5+osBS833kHYPGzMA9MFpgLdSxYYirweWBHkThUNoK
	I9eLRfJYZGhVDQm5Z1vED7k5tXuwXuWJi7JjGa4Oq/kv4O9cE9R136cnB0b3TF0WcUBJQNiYkD/Cr
	usezm+8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQ20-000000072Eq-4ANM;
	Tue, 17 Nov 2026 20:43:56 +0000
Received: from mail-oi1-x246.google.com ([2607:f8b0:4864:20::246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQ1v-000000072Cg-0cjr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 20:43:52 +0000
Received: by mail-oi1-x246.google.com with SMTP id 5614622812f47-4cc89e86e4dso173519b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 12:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794948229; x=1795553029; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+VP2e4/Jx1gpeLV32IskoHLYhFefIx3VrQoyhcc2vQ=;
        b=FJLnbjyUKxqqTY1YSzNNrZVknofuuVYRMybKuUi7Jjtx31oacqtKy8Oe32JPTTa3Cx
         tDIPJD6MgQrEfpP682DVhJSxlLme6u3pL00OD0t4b8kTgDOw7jT8zPpKxawUFUltHRXq
         cqqOKWHoqGdNF5FB5DRcz7Q6xdnTD8JiePZr0lqRjGdAdd/I+Ckg/93yggVQFgggr/0+
         berorurRJ0fEOTSh9fNtyq2eaHCMTiNriS2h2uo1nK5hLj7gJoCOm8zf5yfQAkgrM79v
         1YMBKrxaiDmlK7tJe22qjhJLX4YyAyzwwGbHS3AouP0L32uT3fz5koJAoEI9h6bCUQAS
         YsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948229; x=1795553029;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+VP2e4/Jx1gpeLV32IskoHLYhFefIx3VrQoyhcc2vQ=;
        b=AqaZJhSgD9OoxWUPeT8Fy6UU3o9SArfQv0sNXlq4zGoUb4Xfl27baLwZwuAUWJBrcP
         KgKIyB4yeF47VPxAsQKwGlX+sWBqZrAA+K2VVH51KFT0mRwYAxvj74FG1i6S472nY6a2
         UOVlDh0BmziOYvwLy8I7e7V4WA9Jpg+rQpCyXNkS+K1kGB8CC1iAFNYTAS0expB+S3q/
         HJYD/5A4bgsU3iAIVYgG/v3D7vgWA2F+omsZlUeujU2rDmIjiREnjSvMaujr47/8kqey
         3COgVZRq10XX0t2y0FyhV1VwDZDhZFM/GJKGj3tmDfB8e+hVQP9o33FiRBEDXT1HsAm7
         DUPQ==
X-Forwarded-Encrypted: i=1; AL+hErGXxKEmX5Yw1/vteaAlqx0ILhFahNhyb9MUVaOtq1wNms1VDmRZ+sP/zGVTnVJc6H0RMoEQEkviFu9IxganEPQK@lists.infradead.org
X-Gm-Message-State: APuU4Z9rZO+K7C1c5M+eIjkK6+ZIamTJwQJpUlHxDnyU6/R2RJM0f+DI
	O8EveEEDiH2CltR1kOcM0sTICtgp4+cYjNARmaUAoIpCXNh6ICnCTIAntPz1KKTXUw+Eh6CaQkE
	onTH5iVTjbuZaf+L9Fr+FjEOulg==
X-Received: from jabha52.prod.google.com ([2002:a05:6638:6bb4:b0:620:1989:fc1c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2384:b0:572:72d4:9ac9 with SMTP id 5614622812f47-577424093eamr890686b6e.27.1794948229188;
 Tue, 17 Nov 2026 12:43:49 -0800 (PST)
Date: Tue, 17 Nov 2026 20:42:44 +0000
In-Reply-To: <86fqwz1udi.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116200418.3535619-1-coltonlewis@google.com>
 <20261116200418.3535619-3-coltonlewis@google.com> <86fqwz1udi.wl-maz@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261117204348.4020440-1-coltonlewis@google.com>
Subject: Re: [PATCH v1 2/2] KVM: arm64: selftests: Verify HCR_EL2.NV1 is RES0
 when E2H0 is NI_NV1
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Colton Lewis <coltonlewis@google.com>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_124351_201286_3792DA46 
X-CRM114-Status: UNSURE (   7.47  )
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
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Marc Zyngier <maz@kernel.org> writes:

> I think this is the only reliable test you can implement.

Thanks, I dropped the guest-side HCR_EL2 check and kept only the
KVM_SET_ONE_REG/KVM_GET_ONE_REG test in v2.

-- Colton

