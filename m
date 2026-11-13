Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82536606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fBgJjOJa;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=c/yQTUon
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=A3el8S04EFqA+bkIJ/B4fePgF2ZgOcyTw3ueW29faVU=; b=fBgJjOJaRwDJt7ZgxOQU/tiRoG
	2tTrm/6aJGdoEFvRmrN5laneOK0W/h8OU2dqkliOhYCcZmULMutMfXi7yYt1U8Ov/yhdsN4wqdZ4Z
	6W8EuCMVBkxdlVbbjoY2AR8jpo0320CfnoddJGnG4hj6zFKAVEKhlHzLgKBv/o5nkMjpFxQ1wDaxa
	XzVCabpc4R4jPe3l4rIQDkRI68+8GYJfrhvlwG81yMv1+grenflGyQH/Vta6OlvIleBsEj7YW/JBy
	r4ZbF5bbIx3DheR9o7FaJjj4EcETXEFWpLpGqUqJsEyO+g8297SxukOpxGCXx0Vrm/vCt/M6VKuVF
	WhJ8g4dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxVE-0000000EKp5-1vIl;
	Fri, 13 Nov 2026 20:04:04 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxV8-0000000EKnX-0sHB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 20:04:03 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so661244f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 12:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794600236; x=1795205036; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A3el8S04EFqA+bkIJ/B4fePgF2ZgOcyTw3ueW29faVU=;
        b=c/yQTUon5dz1wlfKjSaFGFqpTjDAXsFk8Fucq9yyvJcmvdI6UsO3X0liFLDidtqSOY
         o/+u9fKCzR24HT9//UZ6l5TITbPPK1iDrZG4pBmamMJM6HdfurbDWf28cgpeQSNG/GmA
         FWck2VonFxe6dg8jJej0dz7IekS6AvxerctDkPrPwRQruX0LsmYIaYGN+/bttOFExzlW
         /LvyeJDdk8KtDBIe/XUvMMwA6CqKIk/g2weVLC9YH6+icGklbedeJ5Rgv1ftKgsx1Pv4
         dT/Kss07qQPm8rDue3uSERJ5xApOZ0TxKDecrinDmBHx3X0036f+p9ikdC76Ccm8gzD7
         PI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794600236; x=1795205036;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3el8S04EFqA+bkIJ/B4fePgF2ZgOcyTw3ueW29faVU=;
        b=LHfVmb+O+rCaAwxxpY7c1+wsaraisYj0moyS/fhPafhrcuho4shoUJu/WOo8CXY4ff
         dxSNjBqQllq0oPdfaaRTe3XiyIGWHkMByhxSoROUGOG+vPUqkbkWPuHLXnWXbtVLRjGX
         Qm4bWhLQmB0UO4+mi9CZVcjgMQOUbfApd1leme6qhPU9EWhcYGXKKsxsQ+qOzCxVmNeo
         NQSc5tnjCCPLvo2aVQonGYGREs8IScA3wGuUQoSMwLpT5g8H/dn8Zp0IY+c2PecSoCIk
         XeQX8vIWPS0sIC+aEvAFkaDfp9iDVuWsZu4nlvE9DJ/34U96aJVPsZNC64+eLTuJ039n
         VA/Q==
X-Forwarded-Encrypted: i=1; AL+hErHqjj9kE9cSp7MSWBHzvNxl4VwDtuAgIa0eC9BTrBZYT5TB00aDTAzN4esry6G+BTyAoa4Hw58W5LhlwHDQWj3Z@lists.infradead.org
X-Gm-Message-State: APuU4Z+66sWfUWxn62TZQ6BWfYrD3Arn/pMyKsDN58XlXMLcqwvBwHg4
	56A0u3Epi+gdv2EQfjL3cpb8Gvl8WKNFbc8tTefodUbn0OSxsEdP900wiieULqCT15k=
X-Gm-Gg: AYBFou2BpeqKTvyhKkWk1G51afqRzN+PG8yXzVKhygqcIGrXDCH4rnLSuQcbdhxqctk
	zTDKY1z5f3T/L5v/eG2mMk7Q0SRqedZ6sCuDpZEN1ecRMgRWGXZ+eGsfUoUEvUs3NdKOS4neaor
	rCdSyoIzd9+8wJxXHPL5L8nblP3jwldTKGX9tW63pT4u0H0VwNc/qylBUJlFHrooTM9dw8lLhLj
	dfkxv+COpfD6L2DcnPR7usep41jkAmCr52JxfeQNWBmQxByhLYltJbiAE5M5kyHCTuiwabBDwOI
	bPjr67x79xQXxnJPEg84by38eu3k8l7VVaEJDIBHBFgRVTzgOzaQgiSDVPUzrZN3Q+DLznbOq1K
	cLBwsOSVWkykGPKFh0q6yzbg1eWKDp0gdykKhLa/nNRX51blEbjSPFhO78PF0neepV5Qx0SK0uv
	in1HPyOa4FWPW4S+ViB//V/ArH5nrKERquoaMCWg0iFjBFdaPZkR6fKEVASqs3SvJE83pZgp3SM
	a3hT0W224YWN3roKk1aiHYsA+caEeEayDXR68+KJqU3TLnSdOoWikPW4P5UWQOrhMSGsgZs8QJu
	98cS9sb4f79Ug4qcJZtDGe9R7Jre30lbW5tHdjfox1BYrR/KrZpHM+bl
X-Received: by 2002:a05:600c:4e13:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4bb55a47fabmr74738355e9.12.1794600235768;
        Fri, 13 Nov 2026 12:03:55 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb55ae5299sm94406885e9.11.2026.11.13.12.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:03:54 -0800 (PST)
Date: Fri, 13 Nov 2026 21:03:53 +0100
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
Message-ID: <avdryC3GOqVNVF8s@monoceros>
References: <cover.1794567577.git.ukleinek@kernel.org>
 <CAJZ5v0jC5YXsLgB6Qd55KNCU0oCsN86X5WpRfL+Ycz0MJ8vGqA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4g7esaq7hdzrtwtt"
Content-Disposition: inline
In-Reply-To: <CAJZ5v0jC5YXsLgB6Qd55KNCU0oCsN86X5WpRfL+Ycz0MJ8vGqA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_120401_365148_9EB50083 
X-CRM114-Status: GOOD (  27.62  )
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


--4g7esaq7hdzrtwtt
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/4] ACPI: Use named initializers for acpi_device_id
 arrays
MIME-Version: 1.0

On Fri, Nov 13, 2026 at 05:17:30PM +0100, Rafael J. Wysocki (Intel) wrote:
> On Fri, Nov 13, 2026 at 12:14=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capab=
le Hub)
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > From: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
> >
> > Hello,
> >
> > this series is about preparing drivers/acpi for a change to struct
> > acpi_device_id. The idea is to replace .driver_data by an anonymous
> > union, see
> > https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylib=
re.com/
> > for more details. (The linked example is about platform_device_id, I
> > intend to apply it acpi_device_id and several others, too.)
> >
> > Before this union can be added, all initializers must use named
> > initializers (C99 calls them designated initializers), which IMHO is a
> > nice cleanup that can stand for itself as it makes the code easier to
> > read.
> >
> > Pawel sent a similar series earlier, find it at
> > https://lore.kernel.org/all/20260727-acpi-refactor-v1-0-ff900aa326ee@th=
egoodpenguin.co.uk/.
> > Compared to that the patch splitting is done differently and the base
> > here is newer.
> >
> > I checked for the other *_device_id and for these there is nothing to do
> > below drivers/acpi because the few instances already use named
> > initializers.
> >
> > The last patch in this series is just some cosmetic to align the coding
> > style. If you consider it churn, just drop it.
> >
> > It would be great to get this series in soon, as keeping it up to date
> > for a later resend is an annoying effort. Thanks for your cooperation.
> >
> > Best regards
> > Uwe
> >
> > Uwe Kleine-K=C3=B6nig (The Capable Hub) (4):
> >   ACPI: Unify acpi_device_id list terminators
> >   ACPI: Drop unused .driver_data initializers in acpi_device_id arrays
> >   ACPI: Use named initializers for acpi_device_id arrays
> >   ACPI: Unify *_device_id list terminators
>=20
> All patches applied as 7.5 material, thanks!

That's great, thank you.

I fatfingered my author address in patch 2, so if someone wails that the
author S-o-b is missing and your tree isn't set in stone yet, something lik=
e:

	git filter-branch -f --env-filter 'if test "$GIT_AUTHOR_NAME" =3D "Uwe Kle=
ine-K=C3=B6nig (The Capable Hub)"; then GIT_AUTHOR_EMAIL=3Du.kleine-koenig@=
baylibre.com; fi' next/master..

should fix it. Sorry!

Best regards
Uwe

--4g7esaq7hdzrtwtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr3bRsACgkQj4D7WH0S
/k566ggAp3mVFLzwpw2p/Hu9/ihSgiW3Z2Tu9oz8iP6Hksl4NiASgBy6mJoash2/
ZDHfLPzYzE0YsfjakvmDc8blOwPZ2QV69Vx9Fc8fLNJi1PvJ74rqfVIPonGSvdXn
6+2YBRjK+POnqAPEnXAd9cApwIMTQ9NYSvjrWGyQouXTDKMInmgoLfb/tYhLof9q
b9dnQA9vTvGhMcKgdtAHObnpFXb94+Jl4CWWoU0Mk9QgO9AOxkb9TjdpZqPCXbcB
A/FFYcgiErFTmvM7eidmBfW/sKlCCSyQdTjpteEL4Nov/1w7p83cyHBBPnKx/mDk
cN+flW8XminlXyu6kws4p0NQuaFi8w==
=bkIh
-----END PGP SIGNATURE-----

--4g7esaq7hdzrtwtt--

