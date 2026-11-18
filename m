Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2B0606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 20:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TT0DBtEb;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c9h0v0K2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U1/r8Tac5IXDtWrYYG3dpfT9UXio9UGAzrSbVmuM17k=; b=TT0DBtEbwJF05dO+hjAY1h4TUX
	dwEek4/ys7jQiUBDa0pVzVvsDDUwbR9RiG+J9fubBsbHgLuu/SHg4L0E0w7yA5ofw9d5UCJZltEAr
	CETGu8bIZObw+e28h9nZMkB8XhHXyecdNnq5A+HG9oFbvHbNKl+tfbjs9zbrgA6wW4KM4IhuUeqOQ
	2ZOs0avr0M2TOmZjORKesYPI5+x9zYBCq9a/4qNICtEZYDMylKRqWXKWDZw+E15/NFT55CE64uKfa
	IwDoY6tQZ19AQbkjf1VbWhu0eIA4wJlwtIcwOf7M5rXVxmoo5jgGC+r5wNFk1w7WzVooKE2gyMhug
	5e0Nr6bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmNL-0000000AEQG-0CWM;
	Wed, 18 Nov 2026 20:35:27 +0000
Received: from mail-oi1-x246.google.com ([2607:f8b0:4864:20::246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmNI-0000000AEPB-0k0T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 20:35:25 +0000
Received: by mail-oi1-x246.google.com with SMTP id 5614622812f47-5384e381fbbso1072449b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 12:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795034122; x=1795638922; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1/r8Tac5IXDtWrYYG3dpfT9UXio9UGAzrSbVmuM17k=;
        b=c9h0v0K2Bkea/9wu9uhEyhczekTt9Rbj4k24q54zahlRtZQqLohsRfe+0t0fV2YLAM
         bO5hUfHh5Fqm2g7tg/t4t+aT1jqLQt/VNHTghcqdmRpKmnQZfX1NhQ/eMg5I/8F3t7HV
         7xKv6wxOagiUZXEuFJ18MOtFVMCjuDzK+fQBZV+2uZd5eYklnzo9gUOxCV9YwTkdZhIc
         piqGnzj9tsSldHLUjxOCqG6yaj595Ss6gdwO/RKYtvDhpPWUb/FWoAYzOwjomtZyQ2bw
         aDPO9rNx6IkMtyBcWXqYdOsX/G+0nIilCIZYvN4I3uHv8hzZxQHx0W1wjXbxqiTnhP7h
         8O2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034122; x=1795638922;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1/r8Tac5IXDtWrYYG3dpfT9UXio9UGAzrSbVmuM17k=;
        b=Ybf/LHvBcMdHNzdBmdrGzDyTb8oeKyXVO6iKLdXcQEnTVPTILfBl6UuPwwLrLe8TlR
         c4VGrBjtrdEh//K4krPP0G706c9uARl3NtIhJNT4xwlr5YKUyeqlCumEOzBuHUMEsBkV
         I/Nt9mAwnysC9yTAbv8+E4N8Fe5ilcOuT2RqeA5BqkobPGooknORB2FrsXe5Xg7DwbDy
         J6BEarvXN/JWOXZ0GxBfhRCBV8WwnWGVNu6n9HF2iUR4JDhAxFx7tNGvigIedtfnhD/N
         5x7uIPV5sGYmTlIUfnXFdkXTjGHMRYLaz0Ehl/y7W/3/YgG2R6cmZVB8k2Kq1S+HwUaf
         WFmA==
X-Forwarded-Encrypted: i=1; AL+hErFPAzH0CV0zLFy7iiaRL0fCTnbiUV0pMhOCI8y8j5ZauZ6d8Gmqy1xOC+Qsv2n2QTTkBMguaTXZnd0oEB4DUuvZ@lists.infradead.org
X-Gm-Message-State: APuU4Z/6tzspkFeuqwuInCpPHI9afLyKoVMl9WWSlA9P/MK51cobmG/M
	AebkVV5W8KUERh0tTpSH8aJY7l0QZBwmiyszZr10vlU2Z3loY+zWSsE3y2EA+mv40wRU368dnnM
	xUI6078oloR+6tnOvrtOeqEOklw==
X-Received: from jacnj16-n1.prod.google.com ([2002:a05:6639:290:10b0:61c:b6b7:f372])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:5088:b0:567:cbf5:bb95 with SMTP id 5614622812f47-5773db242camr4395212b6e.7.1795034122012;
 Wed, 18 Nov 2026 12:35:22 -0800 (PST)
Date: Wed, 18 Nov 2026 20:35:21 +0000
In-Reply-To: <86a4n61m7s.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261117204535.4036191-1-coltonlewis@google.com>
 <20261117204535.4036191-2-coltonlewis@google.com> <avzZUyu9EhxAWtbd@kernel.org>
 <86a4n61m7s.wl-maz@kernel.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118203521.740501-1-coltonlewis@google.com>
Subject: Re: [PATCH v2 1/2] KVM: arm64: Fix inverted E2H0 check for HCR_EL2.NV1
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Colton Lewis <coltonlewis@google.com>, Leonardo Bras <leo.bras@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_123524_216788_099668B6 
X-CRM114-Status: UNSURE (   8.48  )
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

> I really wonder why I bothered describing this, introducing a bug in
> the process. There is no known universe where we can deal with NV1 not
> being RES0, and this helper is purely academic (and therefore wrong).
>
> My personal take on this particular problem is as follows.
>
> -	NEEDS_FEAT(HCR_EL2_NV1, feat_nv2_e2h0_ni), /* Missing from JSON */
> +	NEEDS_FEAT_FLAG(HCR_EL2_NV1, FORCE_RESx), /* Missing from JSON, RES0 as an IMPDEF choice */

Makes sense. KVM never exposes a configuration where HCR_EL2.NV1 can be
non-RES0 anyway (either E2H0=NI_NV1 with VHE, where E2H0 is not
userspace-writable, or E2H0=IMP without FEAT_VHE/FEAT_NV).

I will adopt your simplification in v3 (with Suggested-by) and drop the
helper entirely, which also eliminates the confusing NI feature check
Oliver flagged.

-- Colton

