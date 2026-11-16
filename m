Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEBF606A338
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 17:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EQF9MpKj;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MqN46FAl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mSvoaqmjg32ifr2UgUXPIKGNa+qRJ8bbbR9fyHQLo9g=; b=EQF9MpKjhGkRN9Mzu9v/PZaYLh
	zdgvxakrv7Q3zk5ou8v9b5z6r3JNITG/qKOEjpvHBfCi30irWJWAmt2KhT8C9ltFqg9+Cw07ObqU5
	HVZVwTaltUT6/0LSsPIaB/NhwAeKWkB/1u1ADQejuJjC1URPxih4NIQvU7aUwbhHDxtiXz5wtsSZo
	fWx1FtfwCVYIGWIUGymiSL4zX3URz1a+0Zd8nJgucLUM5mbHC8hCifAQAZR5/5LVIqPFbv8LToi9C
	rQIqWFkJSCNurzs91rsE43Ls4TRakYqdESgb4sxKRUQJIvEziIyVCtaXweJkEHpkhPH/YhTvwXZd2
	P38YMlRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0Jz-00000003NiG-0rac;
	Mon, 16 Nov 2026 17:16:47 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0Jv-00000003NhJ-3XTg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 17:16:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so29453905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 09:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794849401; x=1795454201; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mSvoaqmjg32ifr2UgUXPIKGNa+qRJ8bbbR9fyHQLo9g=;
        b=MqN46FAlKAYXj5+7KzYfXyGpQOBDkJcjJJj8DbQFCFFY4lNzGUbFNNSlhLY4K3rzcx
         Fhc0ByxAow+8sUSLp9p25OPLMMZU/wlG/n6KtqE0QudvR6wlxGffr0WXhUz/jMV4sORt
         ano7NSOxIILdWSuZHdUialGcUGIDBbOr4U0KljouZfRbOX1Sfuy0bE0GHnO4wepIPBhq
         i5zI4NwnN4xm80J2e3RCb4k+sTuFWD/xmZsNOszOeKoPhx3U8BxMcMEBmuPLAY2uR+S1
         r86PvNbrlmrOB1k68eHF94cuFAlzXDd1D1fBu3RFZn182V6wDlVHet3VDfKg/uZpYPS0
         tAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849401; x=1795454201;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSvoaqmjg32ifr2UgUXPIKGNa+qRJ8bbbR9fyHQLo9g=;
        b=V2xwHIr1RtSRoopPy04Za7+V1hY733MyQI3SMHL+KDeqHP5wl9UDVmguh+yobE2yoD
         2XB1dx2hoi5Mjqt8rKfBwrg/guuvPDZ9FgOi8d0hoJiJssJdzv/kUx084Kfi1dncjhEx
         aH1JiayoGVUZkTg6llE6uBF2PxKPSsLGqO2jOMjEzt7EnpSxnP9OVUa/LDh3g9FGPL/G
         foe7GdFSzKz3VKwM+wQthHION7Ir3tXNHoXJrwmF0wkvfNOMzs5rNkbWLH85RuDyMEb7
         y4Xex8pE9wZ22n4h7NyRqZvv+ppnOjhdQJ4t34cOCeZSWVwgjXr4ZscQD0vbrbRyB0LZ
         p1LA==
X-Forwarded-Encrypted: i=1; AL+hErFT0zMgMpmeU+baCEhFbK+ynAb/Sh3RvMrjHQKZBVd9LJFkyCI43gAfEFFeOQO8ppjvLXkoIL6kjG4eWRFT8Vp5@lists.infradead.org
X-Gm-Message-State: APuU4Z/vYJKfcc3bZUDUkhz7UcYzUEf4YvUeRPznfLDMSw3Sf79V30gp
	JyBEpGU8gfDA0ti214428cDtHd8NfUfJIgj1tB1BeCJuuVLNnDGF29AT9qE6Of2R0O0=
X-Gm-Gg: AYBFou06xZNzpIw1VpT1Oqj217qIkEctlUmAKkBfPuVQPqd/+HresN02LsLDHE722GI
	95a16mfd5uGqkl5WxHAnuJJfZ+Nv2LZJqYq1Q7+WdmYGpArETLHk6XVTUASMkOst/9MX5Z9/zE7
	IryFhAudhWI2Luo3m+cf1VkmDbar796lIUtU9yEXWxRxyjySYagrYsBDmfWfb6ETJNgykPKvm2P
	7g9zUWrD83tM/GKZGhSuL8H9qfclU/XthR2G/VOGaLLBfsY77Mdm2VOQEIRQO16QPQesrJiUvKe
	Lb+P5nJY40YOAhS9g3tPqSFIIKKQQ/4BkZc0Hd6OGxPXbNIuSBsCJQj2xJG2MUo8p5UwhwD41J7
	97tAwLmqRcNd00/ZY3KH57C5JYJIjZvqfnm2D4lo0iqtW+CTP6Xm6qXjkzyHr+jf9i4IpTCtwaL
	Nml1TfnW/BSeTWIyfmCQ4BlX7uGgLeHPulU9g5gwi2mTLqDGtgOnhTDJAJgED8M+R1GwxHHv+Le
	ajlWkGUK8tcS8NS5J7TxIIDOj8mJPWDzsvqL+UEKIVC3cv6Yto9reYZ6MYlVHooL1vDOFwtJn4H
	/d/FyxZxvQjXMQrHYk58Z3bApO19RTyHUZni+m9qWoraUaiMI72KwY8kPjxA7BnDMc8tExoc/fY
	QzlAgjm004MrMuReifLifQhPC2bRtud0Hv5buSno=
X-Received: by 2002:a05:600c:3ba5:b0:4bb:741d:eba with SMTP id 5b1f17b1804b1-4bb741d1238mr63980765e9.13.1794849401463;
        Mon, 16 Nov 2026 09:16:41 -0800 (PST)
Received: from localhost (p200300f65f19a90439293c698a65b414.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3929:3c69:8a65:b414])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c5fb58fefsm25945708f8f.26.2026.11.16.09.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:16:40 -0800 (PST)
Date: Mon, 16 Nov 2026 18:16:38 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Dan Williams <djbw@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Ira Weiny <iweiny@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Zhang Rui <rui.zhang@intel.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, Saranya Gopal <saranya.gopal@intel.com>, 
	Gergo Koteles <soyer@irl.hu>, Jakob Riemenschneider <riemenschneiderjakob@gmail.com>, 
	Yauhen Kharuzhy <jekhor@gmail.com>, Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, nvdimm@lists.linux.dev, linux-pci@vger.kernel.org, 
	Kai-Heng Feng <kaihengf@nvidia.com>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Chu Guangqing <chuguangqing@inspur.com>, Andy Shevchenko <andy@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>
Subject: Re: [PATCH v1 0/4] ACPI: Use named initializers for acpi_device_id
 arrays
Message-ID: <avs5thXfoZA4TBnE@monoceros>
References: <cover.1794567577.git.ukleinek@kernel.org>
 <CAJZ5v0jC5YXsLgB6Qd55KNCU0oCsN86X5WpRfL+Ycz0MJ8vGqA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xs75une3ctdjt36i"
Content-Disposition: inline
In-Reply-To: <CAJZ5v0jC5YXsLgB6Qd55KNCU0oCsN86X5WpRfL+Ycz0MJ8vGqA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_091643_918664_F8694773 
X-CRM114-Status: GOOD (  12.33  )
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


--xs75une3ctdjt36i
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/4] ACPI: Use named initializers for acpi_device_id
 arrays
MIME-Version: 1.0

Hey Rafael,

On Fri, Nov 13, 2026 at 05:17:30PM +0100, Rafael J. Wysocki (Intel) wrote:
> > Uwe Kleine-K=F6nig (The Capable Hub) (4):
> >   ACPI: Unify acpi_device_id list terminators
> >   ACPI: Drop unused .driver_data initializers in acpi_device_id arrays
> >   ACPI: Use named initializers for acpi_device_id arrays
> >   ACPI: Unify *_device_id list terminators
>=20
> All patches applied as 7.5 material, thanks!

While rebasing these patches (as part of my wip tree that contains a lot
more similar patches) to next-20261113 I hit some merge conflicts. If
you tell me where you applied it, I can take a look and provide my merge
conflict resolution to allow double checking.

Best regards
Uwe

--xs75une3ctdjt36i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr7OnMACgkQj4D7WH0S
/k5UDgf/Zh/cCBQS3AfcJY+xVzINeExpvzUmIZMMajOqIRB1Ogb1iu0eC9qNdona
axu6POUJXrXH/4pRKQXevRF3+h/9JnryHBdTIe266MjPuRwUmMbGA8WFTkyAB4B1
QWyO8s+I+vnTdOB8Epy5gtqS4T4GHHGkl77vuo+C1qWDCVa9rLVrAvtFGSJ8ULGz
w1dFA50z67Fbkzs1CIqH/smn3i2pPtGjZvfJ3APm3MUbEXCY3U5vKugaE9w7fFF/
RnDbWck5jZ7cSr2Z4gmAk05o1kwfeDTGzRJ6/1zxIdAlPzXZFzMQWhDcgVE+3pQm
cX2okMKS7qwTP1K50XaZeXSwd0t3mA==
=+qin
-----END PGP SIGNATURE-----

--xs75une3ctdjt36i--

