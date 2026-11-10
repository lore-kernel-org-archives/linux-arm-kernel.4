Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C58606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EhkGSWqv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=s3xh1OPWMSdcA09iRqpCvbZacGS5qDw/BGqF7ZNYNM8=; b=EhkGSWqvbtimbqdUGZUMTNPtwr
	eyuM2KWl5mYY42wnrNK6jUL0lj4nu5SIGNgHO2MPiSYUBnMkVMUZ2i+e0fMHHDG9zE2ENmLiFdTvL
	x8HcdoX9Uzz4HkeTJFEjyjOwGIl365CuyDhWPYDcEn7slooUCD6Knl3qL8MjpBZ12xB1RVqQ95S03
	0LKtDlci9R1yzYEETzQlE+ZHno276IUtfeX1vkS9idexDDvXQX/LRZbNQl8dbS31NFKYhvUI6zqfh
	fE+Sppa3396lbin+Px6ZMxPfJBlts5Db2OGMX+9PLiofDH8wUDJAKyMmeZGRMwlr8gGbgURvoc07B
	i2rMk87w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQm3g-000000045Dr-0cIK;
	Tue, 10 Nov 2026 13:38:44 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQm3d-000000045D5-03OS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:38:42 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso20780295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 05:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317919; x=1794922719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3xh1OPWMSdcA09iRqpCvbZacGS5qDw/BGqF7ZNYNM8=;
        b=0nwsLJBwXpusTefiDJziMV7k0e26Qr/3ZxCq6SJWhnMIpLVWn61kTwW2/ROFpbzvRK
         MT3pbyy9zcFOvoow1SqX5nOFS1UaLvOP2odiIMCfmM0B+/HAXjZwcR4Fi2Rm4yDm8mxJ
         KmZvSmAs3n4Gni3SgeWnVVnhulgq28PK5OWi8quxvgXxDcRQZFZ5zKI4q9ggQcA3FP47
         GkFnGXc0GVLXzzYbvijTHqzW5sfFNFDEU1H2T4/SlGIZ9X+iIAuS78XcdUOM3DgrsLz6
         O9P5bRS6ewS/lfl+Bglw0LhxxN3z+XKey3zEtEtPtSbQ+GEncHkRG8eoIzpRjfJwjwoZ
         IBvw==
X-Forwarded-Encrypted: i=1; AL+hErGUvAPpr0uwNwiabFGinSGzO8SPeG7xhpY4U1BL+N64fMGHbQBCStOd1gl5ky3rnpgZiI71GlhOVtLu5sZcYg7G@lists.infradead.org
X-Gm-Message-State: APuU4Z9srN8Kazh7EzrHjqZ6xw2tZq2kHA1ktgcDMmQXvwAdubMN552c
	N4iyuWB1Ft3O5/FAsjMa7irGesV5xaG6QGY1qEISDStpaSia9cx137GF
X-Gm-Gg: AYBFou3t5LBsEg/HsuMDYyqeydINg3dWIfGuTWTiRdyspgLVSZR5P+rMH4V5DjQ7gPz
	44wt6aPr3e8ByMChPD96zm3k4DaBK/PARWun1Gj46XZZvU+pjXi1M9wwM/V0NAC+41fvL35t1cI
	82wQHCXDkBk91HrMKfS/yK4oLxgTkOBIdhRAdUb1wXTsmxG8AN7lhwuej7A4zeHQg3PPAmpkdi9
	Y/L1+EaJJSsG/IM7DPifFKYZyoZdBAX00Gj7kQyKKp4d94mS7jW9RopoUTjmWiJhuuOyocjeDHq
	u29di8uxq84maNxZfMIdJJ3fJQbdCHhKXgj1FiPFtFkJWxn28D5fB20k53QVYbepUEzwQHMZE6B
	K2462+eHpjYzUHzj5sAWpzVRV9QKP2X24nQ1PwMftoPPcJvO2f1A7VW0QMnZ41J0EGOlTIfXoIQ
	cAM+QIdlqWbG7znzwW9nMTIm0kCkBsJ/hQMjI484z5wwIzphOZkXsq+jJKvk9lV1F3qtHtg4+w6
	g5QOH/+/GiuASUaG9ZVTufp8PWaLpL7285O68tVEn23V7m5T4Oy555OSuQR9MVPzT8tBbA2rzo6
	0buPhKdrWEizF17eNsxzFQp3v2McNCeyTxsdDLmmTyYpLjYOjlzmdvn6p6kAMUEljjRUXrUkD/2
	2Nnp3yA/YWJ3Xko1HT+thx8STQrT3L6hBKYkviZyiOJZB6opQ/n5QKXglaZnUgrIJ
X-Received: by 2002:a05:600c:8109:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4ba02349484mr41901935e9.19.1794317918793;
        Tue, 10 Nov 2026 05:38:38 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835c37bdfsm5292609f8f.22.2026.11.10.05.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:38:38 -0800 (PST)
Date: Tue, 10 Nov 2026 16:38:34 +0300
From: Dan Carpenter <dan@cryspen.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Eric Auger <eric.auger@redhat.com>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Carlos =?iso-8859-1?Q?L=F3pez?= <clopez@suse.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Jackie Liu <liuyun01@kylinos.cn>,
	Christoffer Dall <cdall@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: Re: [PATCH] KVM: arm64: vgic-its: Reject ITS_REGS offsets above
 U32_MAX
Message-ID: <avMeWguO2gOTX8Bk@stanley.mountain>
References: <f4b5c3247f88b9c469758f8e14a386364332f9f4.1794251681.git.dan@cryspen.com>
 <86wlql0x5t.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86wlql0x5t.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_053841_058237_B8C4FEA9 
X-CRM114-Status: GOOD (  17.37  )
X-Spam-Score: -1.4 (-)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 10:59:42AM +0000, Marc Zyngier wrote:
> > +	if (offset > U32_MAX)
> > +		return -ENXIO;
> > +
> >  	/*
> >  	 * Although the spec supports upper/lower 32-bit accesses to
> >  	 * 64-bit ITS registers, the userspace ABI requires 64-bit
> 
> I think this is going in the wrong direction. Instead of capping the
> offset at an arbitrary value, the infrastructure should be able to
> deal with arbitrary offsets.
> 
> Could you try the following (untested) hack?
> 
> I also don't think this is worth a Cc stable (the worse case is that
> the VMM accesses an emulated register and sets something nonsensical),
> which it can always do.

Fair enough.  We are in arch/arm64/ so casting a u64 to a pointer and
back works.  Except for these two, the other callers pass values which
fit in a u32 so they aren't affected.

I'm going to remove some of your casts which aren't necessary and add
the uintptr_t cast back.

regards,
dan carpenter


