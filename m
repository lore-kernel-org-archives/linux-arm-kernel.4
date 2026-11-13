Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284FF606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 20:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R6uvNTZ9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UV8SW5bu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xA/dHrB8DVHvhn8WCh7VdIDLIPRiACwfBEGFOII6u8o=; b=R6uvNTZ9NRdxHC
	/dYHzYg0vochd7Xqi2hAXtgPqTrpB2JG/A2mvBLAVv+GvZ16kxUIFIP1SXdGbKHHszaHKTiH18ccD
	wONpQPlE/xlPi+RWEHzZnmOeZS6QwQQ8S3J5MjXtog/yfvQVWADNJBDHXeZO8nnve6cmsJU90yw9H
	dc3AulLDjcFjK60uyUu+Gds76jt+HDYpVsTFbl4SoruEk4Wfc3AP/XUEPweO5WuqUaIma9u3P244+
	UR9+n2NdyGd0mGEdp2yxQwM2rmnXzSpSv8C+NcngKvFujccjFHJk0I6+LuZv3hQtGMRkgpN1lGiRI
	Vfa1di6z99FtWcQ6EdKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxyt-0000000EQtP-2KdC;
	Fri, 13 Nov 2026 20:34:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxys-0000000EQt4-2vyC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 20:34:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 11F4446EB0
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 20:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE2BB1F000CE
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 20:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794602082;
	bh=xA/dHrB8DVHvhn8WCh7VdIDLIPRiACwfBEGFOII6u8o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UV8SW5busPS8VmXNfVtCA8Gy0bDmDzqHePhNmga+YXjs6tdgK4mMuY3lJA6UVrv6F
	 Og18/irl95YcHnECYzmIN6RGkJwoBP+CqhKwq/3OI0ttro56XVwFhud+FCAPccT+38
	 RM4VYeTnymaDrrkZRiYTT9YfbVr+rSmYkya8zngTI9Qlc2iIKOdx4TnNilsvSnrInK
	 xYftri6PomOsPSDloIpP4Vw42Eey7oq4zMBD4Vcy/RcHHRt6n7P0/ebU/1qpMjYds9
	 DZVon4ggKltPGFINtBlvW6Hgwv3MnyU6UQSbe4UTPwrmbU86XyQ9pOhFTZT4JP5NoA
	 pd9vv+I5nNgiQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3accd1ff4c3so17669561fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 12:34:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEBXSTK9h0Q/+iJdS2WJD0j1yQvgsJFxMMC0boCCz0ZFDasUD27Ml0hSpapQUyyWyZQ+FVHhd4WvwrIAa5pTdBU@lists.infradead.org
X-Gm-Message-State: APuU4Z+/ETpyjylHI74p2bAGBdpsK+/qGsYMIW0KTxvrCjSP2Qt11z7N
	/hOXgswClpS2zvj7hDaHmQP3hpYsP5eP6VV0eLwGgXyF/K8ZX20lAhNBa9BZX5JbKlIzqsY6u3R
	cglpPcEkP2wDrIUYeW+DiT0d4Jw5benc=
X-Received: by 2002:a2e:bea8:0:b0:3ae:25c9:f5d1 with SMTP id
 38308e7fff4ca-3ae2b4cb695mr13163291fa.11.1794602079970; Fri, 13 Nov 2026
 12:34:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1794567577.git.ukleinek@kernel.org> <CAJZ5v0jC5YXsLgB6Qd55KNCU0oCsN86X5WpRfL+Ycz0MJ8vGqA@mail.gmail.com>
 <avdryC3GOqVNVF8s@monoceros>
In-Reply-To: <avdryC3GOqVNVF8s@monoceros>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 13 Nov 2026 21:34:26 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jxB4-R2K6iQEh5BVeF1pDXFGn81jkXFCTMJLBAXoL8rA@mail.gmail.com>
X-Gm-Features: AclHuK98RV8mUx3a_eF9a_B1pqyxZw7Jy48hGkbo4K83RPSBSBvPbkBZkEPiro0
Message-ID: <CAJZ5v0jxB4-R2K6iQEh5BVeF1pDXFGn81jkXFCTMJLBAXoL8rA@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] ACPI: Use named initializers for acpi_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Dan Williams <djbw@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Ira Weiny <iweiny@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Zhang Rui <rui.zhang@intel.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, Saranya Gopal <saranya.gopal@intel.com>, 
	Gergo Koteles <soyer@irl.hu>, Jakob Riemenschneider <riemenschneiderjakob@gmail.com>, 
	Yauhen Kharuzhy <jekhor@gmail.com>, Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, nvdimm@lists.linux.dev, 
	linux-pci@vger.kernel.org, Kai-Heng Feng <kaihengf@nvidia.com>, 
	Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Chu Guangqing <chuguangqing@inspur.com>, Andy Shevchenko <andy@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Nov 13, 2026 at 9:04=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capable =
Hub)
<u.kleine-koenig@baylibre.com> wrote:
>
> On Fri, Nov 13, 2026 at 05:17:30PM +0100, Rafael J. Wysocki (Intel) wrote=
:
> > On Fri, Nov 13, 2026 at 12:14=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Cap=
able Hub)
> > <u.kleine-koenig@baylibre.com> wrote:
> > >
> > > From: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
> > >
> > > Hello,
> > >
> > > this series is about preparing drivers/acpi for a change to struct
> > > acpi_device_id. The idea is to replace .driver_data by an anonymous
> > > union, see
> > > https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@bayl=
ibre.com/
> > > for more details. (The linked example is about platform_device_id, I
> > > intend to apply it acpi_device_id and several others, too.)
> > >
> > > Before this union can be added, all initializers must use named
> > > initializers (C99 calls them designated initializers), which IMHO is =
a
> > > nice cleanup that can stand for itself as it makes the code easier to
> > > read.
> > >
> > > Pawel sent a similar series earlier, find it at
> > > https://lore.kernel.org/all/20260727-acpi-refactor-v1-0-ff900aa326ee@=
thegoodpenguin.co.uk/.
> > > Compared to that the patch splitting is done differently and the base
> > > here is newer.
> > >
> > > I checked for the other *_device_id and for these there is nothing to=
 do
> > > below drivers/acpi because the few instances already use named
> > > initializers.
> > >
> > > The last patch in this series is just some cosmetic to align the codi=
ng
> > > style. If you consider it churn, just drop it.
> > >
> > > It would be great to get this series in soon, as keeping it up to dat=
e
> > > for a later resend is an annoying effort. Thanks for your cooperation=
.
> > >
> > > Best regards
> > > Uwe
> > >
> > > Uwe Kleine-K=C3=B6nig (The Capable Hub) (4):
> > >   ACPI: Unify acpi_device_id list terminators
> > >   ACPI: Drop unused .driver_data initializers in acpi_device_id array=
s
> > >   ACPI: Use named initializers for acpi_device_id arrays
> > >   ACPI: Unify *_device_id list terminators
> >
> > All patches applied as 7.5 material, thanks!
>
> That's great, thank you.
>
> I fatfingered my author address in patch 2, so if someone wails that the
> author S-o-b is missing and your tree isn't set in stone yet, something l=
ike:
>
>         git filter-branch -f --env-filter 'if test "$GIT_AUTHOR_NAME" =3D=
 "Uwe Kleine-K=C3=B6nig (The Capable Hub)"; then GIT_AUTHOR_EMAIL=3Du.klein=
e-koenig@baylibre.com; fi' next/master..
>
> should fix it. Sorry!

Thanks for the heads-up, I fixed it up.

