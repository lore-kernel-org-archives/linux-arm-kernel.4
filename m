Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66496606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 12:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zRvPP49r;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ONKQ/L+h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tWEzMxZahU5aZl+oDpjCz5QjGZrinSBosLt6BfIRaLA=; b=zRvPP49r+eGlnU4eKmsADTY0tu
	UYYkQtH4+4mLVmZewQi4c3KdOD/mR152yOs60kQyb24KJmVzGWuMhujzlLZ47mjKwylDrNyccKYXw
	g+qfYgllGS0zNilJOLwFc8bYJpgZScTH7RdMuQ6F3FOHgkxulnUDetAAUZPLsznif16vVuQ8030jC
	wPFzpYZ8yS9LYxkHnYIwTIvuAh5MvHswa8DddY6rHuj65GIPajFMxD3zBQUcoDACSZ1qnTX9MPKX8
	hxbd7diq99Rx8BKebtWvG52N9LfB/arpmYGaEXFoSkwAaoXf1rsDSUpMTXCtvUBKzYJfwDUvJWKh+
	n8t6RbgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDFj-0000000G1lZ-2h4b;
	Sat, 14 Nov 2026 12:53:07 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDFh-0000000G1ko-1942
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 12:53:06 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso23544695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 04:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794660783; x=1795265583; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tWEzMxZahU5aZl+oDpjCz5QjGZrinSBosLt6BfIRaLA=;
        b=ONKQ/L+hE8tUbczYzxcHCpCfRuzDnkCl+8ct7Fj+DcTyTBbkx8mvGZapPgAsm45naO
         lYIGeJhv4fp7bn0pvdq68PNRSYwEcWFiwHTQt6MAoDFnPW0AOs8h8udkRQas+GWEoIVz
         cC9s3690PFHbHzi2GySo/I9+IWByMxeR55cAL6Sj8shpeJcWT0+pr9/si6+o70euf5sM
         YmBA5OvaQd3nB//5fZVE5K4b7Wc7oCyf7uc5FoTA1ZNQsUQDvGcLk4CCQqHKqe1od+wS
         WEy7DMoZ5QPxwgbzbrxOVF8a9sWL3ytOOsMu/HVKcrzfFVGPMv8FeiG1F7LcPQg7+j2G
         2V2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794660783; x=1795265583;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tWEzMxZahU5aZl+oDpjCz5QjGZrinSBosLt6BfIRaLA=;
        b=Urt00tGyDNVgmfS1a3923AeT5sNdPMRYED4vd0MHiyWpiPzBl2MIOw0b4g8TnBVVqw
         egV4SIeU5iUR/rq3BSV3/nsR5t+AvfRu5SHrxvOpJh0m3cmigG//PxqJKNcST8eGzBNE
         aNlwEt4CcMfB72+aQaC42V5Km4p4IwAXRHpyBnuL4IwAiRxePhUFrZVwpfdDYcnldASg
         BB6f3KsWtFJehv2Jote4oBYUtlq6dJdlp2FUGe09IGaBjKQQ6l9xkLEq37DjFjLCXBmZ
         9M2sXmmVkY+dLOxEpuJkJ7+XtwlhOQA1ydFxD4tGwM3cMx6X3doNTX6hnH+A+PeTmW3q
         Yg5A==
X-Gm-Message-State: APuU4Z9sVmw3gk0P7ao5Yt7mWxtOd+bb9zuHXWgmNGWx6pMUzPDxhevT
	GXjwxB/RcQZxmePyHrJOdtUYe6oxOiD9hOwdTAILDkaararX//3cz+NGxJ5F6B6OZc0=
X-Gm-Gg: AYBFou0VkmbpZarCuZCYiBWjs4PZK3SbKltFswb+Wskd0vOc22chkChP+pBGLv/Xg+L
	JZhUMfjaXUH4rWW8iw8rXZA8BjmuSSdIagSWyx2FSTDI56Qb8hUA6iPIRYOGirxKakN88wjxuar
	hbuHqV90/Ss+UA6WIvMTmphd1fTEviBuJZoeY56gVPyGGRJahDNi5F+GCidiR0T7D1/etDTxymH
	5kmhJ6eut9V74zRmaKNmrQg21nvFuFRlYXdAMQFt3A+peWNgWoJ64sfTa9kQkGRtkVHaNAdhxZE
	85BJBXFvLsHCy1vutq+uVh8o6JZM5zScshk9CYKryLnnb07ePLwG5F+JnnavJT9ZDDTnH+j5jDU
	clJBwzwOtrqkykbYbQQIUchFnb/QJlHf8YhZfFrxdSR86IIBzbJCbw3S9PgTFwoduR03X7J3bkh
	8XspweYE8zZiDqmXL+/1U238Bcfk2AEktF5FS3dtpGojIHtxkA/2xJr6RPqreguPx2fWySh64qa
	2QoZNKSSVdva0CQuFcV22aeKg3uXqx7q+/PqhnQ5EvJe2zas2M2CRrAQBw25RS62RojM7sAnUEJ
	PfMWjGbrAOgh0ifocgzS6yN771V7fox31Eyh8TBgOuU=
X-Received: by 2002:a05:600c:1c28:b0:4bb:56bb:116d with SMTP id 5b1f17b1804b1-4bb56bb4938mr124782445e9.25.1794660782745;
        Sat, 14 Nov 2026 04:53:02 -0800 (PST)
Received: from strix.localnet ([197.250.161.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb566220edsm184069425e9.0.2026.11.14.04.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:53:01 -0800 (PST)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, krzk@kernel.org,
 Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v2 00/24] ARM: zte: Add support for Sanechips ZX279128S and ZTE
 ZXHN H3600
Date: Sat, 14 Nov 2026 15:52:38 +0300
Message-ID: <zyhheUsXRh-gOLAQBbI2mA@gmail.com>
In-Reply-To: <20261113003523.3659602-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <rum7uPffTpawXUWooWWkfg@gmail.com>
 <20261113003523.3659602-1-ghahramani.navid@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartwbnUL1wQQaaoZoQUCz2Nng";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_045305_352007_868A4202 
X-CRM114-Status: GOOD (  13.39  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--nextPartwbnUL1wQQaaoZoQUCz2Nng
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Date: Sat, 14 Nov 2026 15:52:38 +0300
Message-ID: <zyhheUsXRh-gOLAQBbI2mA@gmail.com>
In-Reply-To: <20261113003523.3659602-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Am Freitag, 13. November 2026, 03:35:23 Ostafrikanische Zeit schrieb Navid 
Ghahremani:
> Before the MFD and reset parts are final, which way would you prefer?
> 
>  a) new drivers/mfd/zte-zx279128s-crm.c and
>     drivers/reset/reset-zte-zx279128s.c with the same structure as
>     yours
>  b) adding zx279128s compatibles and data to your MFD and reset drivers
>     once they are merged

I prefer to put it in a new file - zte-zx279128s-crm.c sounds good to me. The 
ultimate decision is up to Lee Jones though.

For filenames I try to guess how likely it is that the same hardware (and thus 
driver) occurs on another ZTE zx board. The CRM controllers and their 
ancillary responsibilities are different between zx279128s and zx297520v3. 
(and they are different in the old zx2967xx drivers too)

The PLL turns out to be the same, so my naming it pll-zx.c turned out to be 
the right call.

--nextPartwbnUL1wQQaaoZoQUCz2Nng
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmr4WZYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoip6wP/jHE1SuNmt/lTL+4abXU
fQsp1cNFMcRAYzZrmKaT8IIxsX3jvQH4Zg685n2Sty0LHHCQlRP6o4NhSTWzU0lx
O/IQaw/K8j/WosHCIJQWCKnfZCjARbU8Whv/MOPp4Zn6rY3Yxn8GWTH5ykZUbJhw
vOhhq4PWyH/CAC/Guwu6jWsPh6R2MM5oXFxmboi5B59YnGR/dJkXDUqWSvmpjAo9
Xocj6KV9qmfT8wnY6jr96PmKaGBKmBFqeBlhz+wGmcVWdnorTJlYpIh49LaZ9tqu
0qL+Byj7K6i4x4f1OIPY5A+MEZG1f6F3bzr+cJdCiC3KepV/o1b7JPenS1mODLDo
GoR3F69DAJ9b7p5wtahOZe/sM6BWhWGmknc/UdIBHyd1KWRMjhSECzzgR8KFLkz3
qfju3t7Aq+QO24yQ9Adp5RMaVFYSBBhlMVn7AK0tXUdOX6ZRG3IL4eVHQsmeJDjo
CXcE07nXDlKCdalRuBKpvvBYmdXdpnsxhU88ncALCvp9h4QtOHOalliwGwVMqaQg
mocpo3ohpk/SpPWPufFZE7VXpEEL6KXVEE7S3MOm0ZL5DMQzx550n2Tkhn8/KSqS
1o0jSuLH1u7PWZBXGzTdUaTE3LSZaxO1VbI7onD0rxn7GjiGs5vV6cGhLknvco2k
KjzS27esqAN6+ZpxN94kdIQC
=3ADZ
-----END PGP SIGNATURE-----

--nextPartwbnUL1wQQaaoZoQUCz2Nng--




