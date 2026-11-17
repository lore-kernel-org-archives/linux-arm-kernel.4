Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C6C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 07:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0OzZaB0I;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i37xuFof
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2ig6VaSgCXuiuyN2YfSP2KMmKdlCjFPySPXtFnYMWLs=; b=0OzZaB0IDSYgleZF958UiygvRq
	rxjgRlZf114XXwJ8VeMscigQvn2dTe1Yn/6pWxGkkqSJAO3ZL11XPE0PxbjTNta6E4prgxP9kGGM1
	eudZH/fcOofkv0Bxb7VuP3zIInJ4EP8ElFQtfbKhdY7X0YANgu9t8RNkhA8BowYxJXsn9JZO0y+a6
	kyVdac17EB6x+hH8Whha0Z3E/EO0PtSQYTPrc1acxytznLEqUDSH/uQQckz0iO1xzF6HpJIdDaaVY
	SryBOr1+hB0SA6MNeoth07AZJVsTW4RmOwnHx/qZXR2UO+sAp7YVN8yxdO/rAZ3OH00/5xlMdbCiv
	szpLS0KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDNq-00000004kX3-2anZ;
	Tue, 17 Nov 2026 07:13:38 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTDNl-00000004kWU-2i04
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 07:13:36 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso2331975a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 23:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794899612; x=1795504412; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ig6VaSgCXuiuyN2YfSP2KMmKdlCjFPySPXtFnYMWLs=;
        b=i37xuFofegIY1by+mnmv6nfFgkkaehQCSfZtyHYkU359A80glsxc8O2L45Og0GGWNI
         RReR7Bxm4f4GrsEVHIUgXZMuM/0dmwtTBZazJQgh4ECj6Eap9nWloVpqaVZKC/o7SZHW
         5FDYtNUVLVmDiYhT6I1B6Sk6iDfnlRY8pXFY/rCC5IZdwhYSGRUgcIdExRKAqDosCuDb
         HTjvfum5JwMnZQ94exAy7lt8Mxi42tSvV2muz+WQ5i/31a1c56C4INkr4AZPVg+SAizU
         RBR+hUsWqhqvL4W42BmI0GFGlttTBra9QMimruQZ3Lg5OpefqhAkq3OCTKH8+dTkWIhM
         Yfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794899612; x=1795504412;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ig6VaSgCXuiuyN2YfSP2KMmKdlCjFPySPXtFnYMWLs=;
        b=kZDTkh0i/AooTgEoTk18t1+XFwWG8FPCfiiK5KjiWF29JCdLsQesJlGXsfk6Ba4uT3
         6hkm92/L+JITB+vqbvE3vLEAR1NVkSmdmyJOPTIThpj6W56bFyFoDNdn/O9MQojGI4EU
         Yihw7gAOQuiEIYZY07+0nEvM6l1jSMuorfpRIbX8kce4dIVZ7589ye+gvZ0JHossQlsZ
         6XOLEjZ2how1g0Mm0qQgXDSeThmcwK4mHB5RGlHP4X1R5/d7dpP1IYkgZKmY2YxzSmlQ
         AprhTYsesZmMWviOzreZr/PLBMR1Lz5x31XifGXaf78gtWSdSsQ860j1qhK3mAx+/8tw
         /yVQ==
X-Forwarded-Encrypted: i=1; AL+hErHDTmdpsdSgDoQo1ajRkiVzDESTTC48WqmDHl6fjkCqBDFvro0Bh3uXyr7AgCAfHjAXNqP4bfWBBDWbMIshsZpV@lists.infradead.org
X-Gm-Message-State: APuU4Z8G6pZV7/+tKdbp7eIMuLauttho7oVz2ws3FaUAu5sDFSte2CBl
	nqs47MXoCoBoIToznRKV5s8cmEtLQiuvw0LCk8HGGm1NSLjrboFz5+mU
X-Gm-Gg: AZFdTZdodp64b0iIavkPoxliMBTTgkUoHml6ZYH96Xmg1M/o1OgNQF3qx8Osl+8Zb7P
	5QK1UszKLZclCpQhSpm/1QEYew9cwsAApmvVzaHZeEsoz0Crt1EedlPwyLGJxP/qtfN3uTMujDY
	+Rt5cC/T6q9ONE/blDbKe/Typk8+RutxQgZ9MDluS7E7zL2E+pogkBSGoLVO4m+nypN4MIs+Eih
	nw0cxsp2bg5VkbsWo/giytYvvwP2Ls1avE2wnu0lZPB2QfBUyfAw/TxBeaiBupiQxJKif3foE3h
	h97b2AccJROAmOeHTBUcIFjLYnZqg2IUOdZeZgWbwsu//CBmBm5LQ7Fpb8JDmVSlZSLKz8Ie3H8
	20g4XKMZ38wAzGi426Im15MO6Wk+4w/4W3cYYqXe64EqJH9cPxDz5LU3NQmUZSCpu3EKAue5MhO
	h54jhR0+TvrsCb1l00HM1Q+NSdxFyICSN1dNu+tSEewqfCF2drMTORlKpb8dBSd8ToDQWZJoiV+
	64kntlQQlyuknzzFro0roTTW2rL9YIgv9+CU40wvm6UkAnMxKEkFYW1rTHQgirUWe2DyI0C1mf2
	x/7P4SOC2/oOq4MOY5AsLNxYR9k=
X-Received: by 2002:a17:90b:5687:b0:3b0:91ce:672e with SMTP id 98e67ed59e1d1-3b1b0a407d6mr12704650a91.17.1794899611999;
        Mon, 16 Nov 2026 23:13:31 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2550e1sm2581347a91.3.2026.11.16.23.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:13:31 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 8842A4240780; Tue, 17 Nov 2026 14:13:27 +0700 (WIB)
Date: Tue, 17 Nov 2026 14:13:27 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Lincoln Wallace <locnnil0@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Cc: linux@armlinux.org.uk, kees@kernel.org, will@kernel.org,
	linusw@kernel.org, f.fainelli@gmail.com, catalin.marinas@arm.com,
	joe@perches.com, linux-kernel@vger.kernel.org,
	Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] ARM: Drop outdated links in comments
Message-ID: <avv-kYJ4PGgSnaad@archie.me>
References: <20260718175114.1404471-1-locnnil0@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7iwgQdVqEyoHJMRV"
Content-Disposition: inline
In-Reply-To: <20260718175114.1404471-1-locnnil0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_231333_687588_7E980BAE 
X-CRM114-Status: GOOD (  14.64  )
X-Spam-Score: 1.2 (+)
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--7iwgQdVqEyoHJMRV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lincoln,

On Sat, Jul 18, 2026 at 02:51:14PM -0300, Lincoln Wallace wrote:
> diff --git a/arch/arm/kernel/hibernate.c b/arch/arm/kernel/hibernate.c
> index 231a76af09a0..5bec408478d2 100644
> --- a/arch/arm/kernel/hibernate.c
> +++ b/arch/arm/kernel/hibernate.c
> @@ -7,10 +7,6 @@
>   * Ubuntu project, hibernation support for mach-dove
>   * Copyright (C) 2010 Nokia Corporation (Hiroshi Doyu)
>   * Copyright (C) 2010 Texas Instruments, Inc. (Teerth Reddy et al.)
> - *  https://lkml.org/lkml/2010/6/18/4
> - *  https://lists.linux-foundation.org/pipermail/linux-pm/2010-June/0274=
22.html
> - *  https://patchwork.kernel.org/patch/96442/
> - *
>   * Copyright (C) 2006 Rafael J. Wysocki <rjw@sisk.pl>
>   */
> =20

There are lore links for these ([1], [2], [3]). I'll send a patch shortly.
Thanks.

[1]: https://lore.kernel.org/all/AANLkTimmvPMG0GFEXfgFlXgC7V4dIWmW8vEC5gegs=
KSE@mail.gmail.com/
[2]: https://lore.kernel.org/all/1277908081-17195-1-git-send-email-Hiroshi.=
DOYU@nokia.com/
[3]: https://lore.kernel.org/all/5A47E75E594F054BAF48C5E4FC4B92AB0322A8AACA=
@dbde02.ent.ti.com/

--=20
An old man doll... just what I always wanted! - Clara

--7iwgQdVqEyoHJMRV
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCavv+kQAKCRD2uYlJVVFO
o7ZqAPsHovBFDs+Y2+Zr2bvgXMVig4hsWRvRoQjn21bPeJQVHAEAikX057N0YNVy
VLGgpl32CfgV7dgSy00s6p6a0ll9kwY=
=e3m/
-----END PGP SIGNATURE-----

--7iwgQdVqEyoHJMRV--

