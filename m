Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D89D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tWm4q9Nv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CkEwXMjM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZzX9V4TTBmSlkYz6J8Lbn80e+REH2S26Di72JYTGVqM=; b=tWm4q9Nvyd6AeP
	TxOu/5bqpJzc4ZPrpAooubWZZbLAh1bH+z3tCMQOdVtqHvTWTQrEht+XpwzYHRWGTfK/sse970W7P
	VeGU6l36afV23uelOWIKqZsv4ZdOJdL31LTaknpwiuPxxNEbfyR0kPejj7SWzU4JMaDijr5BeC1Tf
	nz3LhB7B6sImfeR/H7KrPxg76dWVLn4XdpaljzwX+KZMkjYDPERzjnrILBE9BsuZcoKpyqpp8oIc6
	qjnf6Qg3hwZspGsAj0U3Oh/zpHXcrRcZ5hG227Ag8LnI7Dag7mxrMYOZFMV/T1FHdVRWol9JVen8m
	67neW21w2IAL7hZgHPkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1FN-00000003VlU-2CBf;
	Mon, 16 Nov 2026 18:16:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1FL-00000003VlN-2SIA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:16:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F36EE61D13
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 18:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA8B1F000CD
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 18:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794852962;
	bh=ZzX9V4TTBmSlkYz6J8Lbn80e+REH2S26Di72JYTGVqM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CkEwXMjMGSDd9Jyf0aI46LScxzgItIsBaRf8Q9l5eAORBkXopGaa7iIhiGIZ7mGrA
	 5CA1yxO3sD34U/yF/V1notyK9oLYVj/U97pWdlB4jqFl5zP5m2gQVTrY3d3shUnNbB
	 7rvPI4k26XltupsNLYGmujI/vVrzLp/9PIxW8imSqMIwFs3QnN50BHdfsjkGX7G7UY
	 iA815OxjWUoVL20FYHH1kVNWAKqEprje/GVx8CMjDAJsCeWO4eE/TEptQAEfSE/8M5
	 pPB+FDWx2ryUZRgUEX2Swq+DPRqM5f1Ko0NovgIqrghdG+FyF+JkCVFjnIt423d4Um
	 4PPJaFSvB0kOw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ae0eb56ba1so38182911fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 10:16:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHqLfXy2CrDoTwEXAPoBJRavVqrHXJNXAv7rujcP8cZfLw+m5SYHaMIwBUJUrUypCcH0fY8AvuVdw6UsiUKSgNP@lists.infradead.org
X-Gm-Message-State: APuU4Z+j8Bv2UgyeXuppdZqORHEmp5bhdOSz3IrqyzO3VQ+t+NqTUlH4
	JlIyeuFWMww4SnYwFIfttOyO0nt9Ui3Dtls5mSAtiBxVuhYBS2YqyKGJZSTvdqYOJSUTwa65ZVM
	e70E4ScRiCwWnvmIxBELqpFcSBu+e8gQ=
X-Received: by 2002:a05:651c:e0a:b0:3ab:3bf3:1604 with SMTP id
 38308e7fff4ca-3ae2b522732mr39554201fa.26.1794852961071; Mon, 16 Nov 2026
 10:16:01 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1794567577.git.ukleinek@kernel.org> <CAJZ5v0jC5YXsLgB6Qd55KNCU0oCsN86X5WpRfL+Ycz0MJ8vGqA@mail.gmail.com>
 <avs5thXfoZA4TBnE@monoceros>
In-Reply-To: <avs5thXfoZA4TBnE@monoceros>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 16 Nov 2026 19:15:48 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iSJVszOCLCuK+ifCzTgx1RgDAExaYUbij=jaWmaTsb8Q@mail.gmail.com>
X-Gm-Features: AclHuK94GxXVADZ_eYaxYKF2omkpVW60DdECEGw9yQWKt3TSZ2-Rx4HqR0isNuY
Message-ID: <CAJZ5v0iSJVszOCLCuK+ifCzTgx1RgDAExaYUbij=jaWmaTsb8Q@mail.gmail.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 6:16=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capable =
Hub)
<u.kleine-koenig@baylibre.com> wrote:
>
> Hey Rafael,
>
> On Fri, Nov 13, 2026 at 05:17:30PM +0100, Rafael J. Wysocki (Intel) wrote=
:
> > > Uwe Kleine-K=C3=B6nig (The Capable Hub) (4):
> > >   ACPI: Unify acpi_device_id list terminators
> > >   ACPI: Drop unused .driver_data initializers in acpi_device_id array=
s
> > >   ACPI: Use named initializers for acpi_device_id arrays
> > >   ACPI: Unify *_device_id list terminators
> >
> > All patches applied as 7.5 material, thanks!
>
> While rebasing these patches (as part of my wip tree that contains a lot
> more similar patches) to next-20261113 I hit some merge conflicts. If
> you tell me where you applied it, I can take a look and provide my merge
> conflict resolution to allow double checking.

I've rebased a couple of patches on some material merged previously.

Please see

https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/=
?h=3Dlinux-next&id=3D58d4ba8979133c41cd491dff1dab40626daa924a

