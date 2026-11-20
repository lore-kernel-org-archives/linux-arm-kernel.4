Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00D9606A69D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 23:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p/evG8h0;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TebdkuCK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tjkEaKVx0EkLFfCfrBHhfTQA5sv8oXwqq+8kKvrMx3s=; b=p/evG8h0e/7neKl3QIu9bGydkl
	+rgQCCI8r/kCNIwe5K7BsC1kUFD67j8J6FtOw2ShJ+MuCmm7RtcyxBudnN91FFK8QfinJ93I7+yPS
	Ztc5/YEGj8LCCLWKCspjplJ/+BXthMHKqt3prAT0sfxuCXZiN0eaiL53lOKCqB/0qRvJKZgcD9axy
	lsaYEGLCfwr4BBj+jxO7vXrG8Nd0jzfbfKfEz9BI5U189JyGk3qnGip/qeKo19UJwZB7KF7p0yMu2
	1/j0G9r1xqy+pgGJmUuscOVJWQpkkD/ZgkfYv/M/MsDP6SIld9CMdr8fVoj6gcyPTb25BOtBw07RA
	vcVgDpBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXkN-0000000GNiy-1odN;
	Fri, 20 Nov 2026 23:10:23 +0000
Received: from mail-oa1-x46.google.com ([2001:4860:4864:20::46])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUXkL-0000000GNib-2EuB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 23:10:23 +0000
Received: by mail-oa1-x46.google.com with SMTP id 586e51a60fabf-45ecb9dd589so1300647fac.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 15:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795216219; x=1795821019; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tjkEaKVx0EkLFfCfrBHhfTQA5sv8oXwqq+8kKvrMx3s=;
        b=TebdkuCKzmpMu7eNgX3w2sU/DO5GrojoHH9uXz1CMVbxSgUshNMf7eVZXMz/ooYZlv
         4eu4Bn51yEWdT+GKeuuGbRNzvqhvPluD3cGc+aKACfMVHpgfP4FjWtpUpBZN2BQ4vJh9
         vN0YeHDzrn8uT+F2SIsjFkgxU7HgrfL5fnZ3zgD75DXNIhqS2+vkUnZD9/cccvCtxf+V
         HJnHYfaWsZxa942U3c0KvzOPZDdQ4NVYK6zatWnmaCf07qqVRlj7JWaKX0FynBwbipoL
         qt70cp5mYD7agdnKQxDtHNILkLSYe/t33qe5rUvUdIv04N6WU5NMf+N8GcOPZnPxUiSK
         aZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795216219; x=1795821019;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjkEaKVx0EkLFfCfrBHhfTQA5sv8oXwqq+8kKvrMx3s=;
        b=lsmRLY7r+wXMtUJzwt4EFOZ0LW+D7E4tTAaVWaIJD8v+P4Y+fUayjBRO2ZtR88498b
         p3ALUEzD8ZSeWSIGPvzlw1qnhoLoEnqrFVTYOexmocrQ6wcypSeUYHw7GJw9ZcLWjh77
         RVL8VlkRoWh48SicqDpBfAogNbEFF1Rpppg0IHP27gbmIZuCS3mWgnYXpCw8GtLEMc5l
         NIcRjM3xgQwm8q45MrbEKmw/tbjW4bLYes0r+Pr9M4kHpnMyRpqs06OpX9dlDiAujpyX
         NkU5jc8lxK9u8yAg8upm8IeQEFWIpsBshrxBqWvyR9+yHVeac67VvnyI5sXlqzbaV7c6
         Joqw==
X-Forwarded-Encrypted: i=1; AL+hErGKpgSZcjxu3ZICLuDCdGkbXVJ/cE0QjQUrqaXhtC8hfKSdHvre6j6t4C7rWxn+NYexUnMlrDDkema++h6zCX+K@lists.infradead.org
X-Gm-Message-State: APuU4Z/GUim4BDMZIoXaboz75RTclKi1261D+BVkx3Jx7cVWvFU1045U
	NYWuD7Tr/JoVp7wYwob42dRXQp1UXZsSgJm6rWSEwIpGd5XP/qHY/7QGNxfygIOP7gbADaowqb1
	JKAxJDpAPATMKhgmcpJO+sja/TQ==
X-Received: from iobcd11.prod.google.com ([2002:a05:6602:428b:b0:9c0:11e6:874e])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:6615:b0:4cb:b6dd:2fe2 with SMTP id 5614622812f47-57a06a10f8amr5107904b6e.4.1795216218901;
 Fri, 20 Nov 2026 15:10:18 -0800 (PST)
Date: Fri, 20 Nov 2026 23:10:18 +0000
In-Reply-To: <87cxrz92nu.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185105.626343-1-coltonlewis@google.com> <87cxrz92nu.wl-maz@kernel.org>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261120231018.1148621-1-coltonlewis@google.com>
Subject: Re: [PATCH] KVM: arm64: nv: Fix guest stage-2 mapping leak on
 sub-block unmap
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Steffen Eiden <seiden@linux.ibm.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_151021_602871_D3EFE732 
X-CRM114-Status: UNSURE (   7.99  )
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
	SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 20 Nov 2026 11:13:09 +0000, Marc Zyngier <maz@kernel.org> wrote:
> I stopped reading here. Please come back with an actual description of
> the problem that you will have produced yourself, or provide the
> original LLM report (it cannot be much worse than the above).

Sorry about that. I will clean up the slop.

