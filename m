Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38308606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 20:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BHJ+k0Yu;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mTRgImG3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4s7Hggd7+AEEhOvi2jMoV+jP1lHkwbJcfKFilHVKaf0=; b=BHJ+k0Yuc9OkSJAqRBWSa8RN6m
	wHlGqby3EovMhFlZM1b+RAt1x1YMA8UcwXFRDqfTF9FiHi7nbzK+2fukinDrCI1Mh+g2Shf//futF
	6TZPNcJkOgSUMr+fTcjpwplV/+KJXBYRGJdToejX3BBagT8e0HGGIwrd0r4b/zdNVkxV4wBmxlOqK
	w8xLSQuEi+JMM9v/BfGcUt1L2y2awfobRJpkzkUCfACobfOcMVBFr3OcsEuLBeBWV6XuY0q8mhalN
	bVK0EVJmmE52Vf2uYhGtMekh0etDjdWjLfWuWSnVfYJC1wUQYcrFB35GbE0RcY4llfOM7C8q1qq/w
	zoe3Kmmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQ1t-000000072Ce-3ihj;
	Tue, 17 Nov 2026 20:43:49 +0000
Received: from mail-oi1-x248.google.com ([2607:f8b0:4864:20::248])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQ1q-000000072C9-30qo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 20:43:47 +0000
Received: by mail-oi1-x248.google.com with SMTP id 5614622812f47-5727b04b81eso83981b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 12:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794948225; x=1795553025; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4s7Hggd7+AEEhOvi2jMoV+jP1lHkwbJcfKFilHVKaf0=;
        b=mTRgImG3E1HRJ2TV+7HJc91w9Tnc7JY4O4c0otOL+Bbxkxf4punw8qK7ppP0W3LrEm
         jgMg0R1LM8A6bIK8xwaQYsiSfTl6aZUWFT6VfUKnABLEEtaS+Iut60b74eFU1Hg1rzwH
         WYbz6zfUCtwNzYtw1y+Wj2BBfI2RT6hGxZk/WUbPwKa0jOb/InO5dPupj1Mq2w75YchQ
         Vs4X68zE1Botr809Nyi5vZjnQvIqYnOVJ5fGP3S3aH0knuMpc9b82cGt+mL/Qjk9bA9F
         yuP0bOUx+se4xXi08JGb4WRtKgbuH3F+V2AbcmtI9K/A+MC4Ip1zmpo7M/F0ox22UUc1
         gMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948225; x=1795553025;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4s7Hggd7+AEEhOvi2jMoV+jP1lHkwbJcfKFilHVKaf0=;
        b=ljnAhQU6oLnxBqxHD/nIN1NvLjXsPGh0Xh2lsuQ60c89ZpLOhbafVHD5fDZ8euzdZo
         k2y6VtzI5uoXs/6puUyZuUVzID1Onm12mX3gnPir8Ybk2aFUVRU0RZ6wQVFJSik4qWpu
         ILQh34TfCCTQ2NzUm6GIGOqG3i5DbxG9r/HK6B3unxbkp7kqckEakkWyjsJ4J3OJnamQ
         8SQxAIyTJy/NBaA48YPGWoJRhlxwUQHAbb2t0TfHxxNPTvHQFDRqTMAb1cnWwsftHO3q
         YeOtXMu/BM1XA0m3ze/opp4PGRYROI585QmRuv+SqTxLCs1X9XCwL77LVwFX/QgNubvJ
         ibgA==
X-Forwarded-Encrypted: i=1; AL+hErFXyu2OZVaqU8rEMlofWuU5U7o/V63EJhk/gThxD2cJPnJ/euATdcYVWeDhRL2TQex1c49+JaU153Nncb8nBNVw@lists.infradead.org
X-Gm-Message-State: APuU4Z9QazbZiVl1L9DxZANT8hdgnV5XVGx5wibyIWzGe3ohHNKu9+H6
	jXvlr3WYCi02wKRHsUStTatkPXhFBqrz3DAamWDR0ytawv8iJ1a5Z82RsRUfxPs9PoxGxEXD0U+
	Qaz3AXk/p5XtN9STKntlbGBVAYQ==
X-Received: from ilbej27-n2.prod.google.com ([2002:a05:6e02:4e1b:20b0:522:8039:f8b4])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1c0b:b0:571:b166:3d76 with SMTP id 5614622812f47-5773c6322b9mr918759b6e.29.1794948224648;
 Tue, 17 Nov 2026 12:43:44 -0800 (PST)
Date: Tue, 17 Nov 2026 20:42:19 +0000
In-Reply-To: <avyNBn24sLjxrfgR@LeoBrasDK>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116200418.3535619-1-coltonlewis@google.com>
 <20261116200418.3535619-2-coltonlewis@google.com> <avyNBn24sLjxrfgR@LeoBrasDK>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261117204343.4017815-1-coltonlewis@google.com>
Subject: Re: [PATCH v1 1/2] KVM: arm64: Fix inverted E2H0 check for HCR_EL2.NV1
From: Colton Lewis <coltonlewis@google.com>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Colton Lewis <coltonlewis@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_124346_756494_5418ED29 
X-CRM114-Status: UNSURE (   7.11  )
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

Leonardo Bras <leo.bras@arm.com> writes:

> Maybe feat_nv2_e2h0_not_res0(). What do you think?

Agreed on renaming it. Since HCR_EL2.NV1 is the bit marked RES0 (while
ID_AA64MMFR4_EL1.E2H0 is the signed ID field controlling it), I renamed
the helper to feat_nv2_nv1_not_res0() in v2.

-- Colton

