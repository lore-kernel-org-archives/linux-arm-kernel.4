Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC35D606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g0XE8tbq;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=md4tj/mq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k5VQE3knwQrnmwo+9jJf7WpJcK1ieoPOD0FVY0qZ3L4=; b=g0XE8tbqs7GS7B+57nkeEIcBAH
	n38k6pikNbyxoxa4IwpYOvNHRv+/NZfpO2Tu3fjeq10nQLQjgO2m+S1P7EX82LTBm5BUQZFLYovva
	7wZcdE0O7L4X9TPmxlBfAbpRoEXGKUWiUIu9n2yYBL2Xxij42Md6SVIqv3UU/7Ak2GmJS0RrUsnh1
	lJPCQKrAOoGSUEwt9l6O43LKbUvSyQIYd9xzxigMJUm15I8q6MrqNVssRAKHh+CTm4p5rdtWzy6zO
	Ajn6gFelq2RprdtQxpDnsj8RRaASLyFmtqGJfoTpbhN15zaLSXpVaP1GsVF0/VYUVT6QCnKcqW5xU
	8OrhEuRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThP0-00000009DDV-2HHT;
	Wed, 18 Nov 2026 15:16:50 +0000
Received: from out-23.mta1.migadu.com ([95.215.58.23] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThOv-00000009DBk-1SYG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:16:49 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=k5VQE3knwQrnmwo+9jJf7WpJcK1ieoPOD0FVY0qZ3L4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795015002; v=1; x=1795619802;
 b=md4tj/mqstB1cQECov39e9j92RxNmjOIKsjr3NZBW0dx41F2cO3ecQkUCGEbAmqcEMpOpkyR
 r+NHhQ40/J/J9qDAWFqTtSartaTyUqWEaiqj4bXs385HiQC6hxUDzJyJPxD1nzJnLFl6np7gi6o
 nHUSXnirVFJyKx15bdhqPXcY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4129d80cdd1463f3;
	Wed, 18 Nov 2026 15:16:42 +0000
X-Mizu-Trace-ID: 4129d80cdd1463f3
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be58ad9600so9471e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:16:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEFBPZ5KOKlzbMy1Gbj500wwOWpl7M0BslOpnYOews+8qMBrs0GN45Q0/U0R7TyoUy3IYMkOUY8We2MsZQ/zaGG@lists.infradead.org
X-Gm-Message-State: APuU4Z/7vChE4b7BMPvoiR1BrKqciXT74QQaDcXSVJcZtffL5apQMGad
	21K9R2E3aG/3FnkrlehohBozvs5UewsK5S+uWVpoEzN6FJCeKp/pZpShVDs5JuOMG3TVo5OZS2W
	LC1doRIV04WDHpdC/dAAE926H4NwoqeiZfWDz4HaM
X-Received: by 2002:a05:6512:ba9:b0:5c1:26d6:ef64 with SMTP id
 2adb3069b0e04-5c1aac83c11mr178614e87.13.1795014997643; Wed, 18 Nov 2026
 07:16:37 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
 <20261112145814.853424-1-fuad.tabba@linux.dev> <avrzusx1g1ZICo0Q@red-moon>
 <CA+EHjTyGQbS7zcHSRg50c5xVN2AY4AmMc7JqNAvrc=_UhPQ+kg@mail.gmail.com>
 <avsN0E-6_7kU3pTk@red-moon> <ea064380-ad7b-4f79-ac17-1174555ed10a@arm.com>
In-Reply-To: <ea064380-ad7b-4f79-ac17-1174555ed10a@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 18 Nov 2026 15:16:01 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwei41=zCQakSk-mBS9L+vp_jtjRJ=eKAwWXyaC1mXsQw@mail.gmail.com>
X-Gm-Features: AclHuK-LwFI0bEYoy4wIHT2mQsw-X3kab-SBMiVRWf5BC3IdE6u4b5Ur5BWr4jw
Message-ID: <CA+EHjTwei41=zCQakSk-mBS9L+vp_jtjRJ=eKAwWXyaC1mXsQw@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] irqchip/gic-v5: Fix misc IRS and ITS host driver issues
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_071646_727996_ED293309 
X-CRM114-Status: GOOD (  20.04  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sascha, Lorenzo,

On Wed, 18 Nov 2026 at 14:59, Sascha Bischoff <sascha.bischoff@arm.com> wrote:
[...]
> I'm more than happy to include "irqchip/gic-v5: Clean a level 2 device
> table before making it valid" in v3!

Thanks.

> >>>
> >>> The latter, though freeing memory on timeout wasn't a good idea given
> >>> that there is no way to cancel the respective, pending, mapping.
> >>
> >> Thanks, that answers it. If you'd like a patch that doesn't free the
> >> memory on a timeout, let me know and I'll send one.
> >
> > Thanks. Again, if that timeout expires I think we have more serious
> > problems than the IST mapping but I do agree that freeing memory
> > is not the answer; not urgent - please send a patch given that
> > you spotted it, can obviously do it too.
>
> I've got some patches addressing the ITT and IST mapping issues in the
> host driver, which I can include in v3 if you haven't already started
> working on these. I'll make sure to include the appropriate Reported-by
> tags, of course!
>
> I'll post a fix for the VMT separately as it doesn't belong in this series.

I haven't started on anything, so I'll leave this with you then.

Cheers,
/fuad

