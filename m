Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F92606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 02:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KovtKIyU;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FOJ0zh4z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Yq6Wg8dZm4uB3bJQCmf1miWvm1ABWBJ7TTfz/AA487Q=; b=KovtKIyULmHcCr
	AyFZ/hAill8sRoq7RmHFDxdviTMi1Ks+xQWtCBVLLm5GrQ0nhj9lGlSEPbm5Bmu6yOtIas/UKvxEI
	qM2Fbjgw5yq29v8RerOU950IZDx0tHzO9yP6gmEo0Wy73Yu8fLeftjmGeSDhlTMpf59GD+fNolOLc
	F788inOWMGSVPhHuT8JejfKuYyZWv5HMGcCturAuSirnEe8EAHogGX+cR3+++7ZB1zWrEAaAMf007
	b9n5P92Dpbor7pRKi0YLnElz+HRelX6CRIQ7HDi3Aw27pMqnSfv5BSXnH7SsL1KfFdo/lIpcJ0CtY
	wEyc9Wmxa67NMk3jzxUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQFMQ-0000000H9T0-37BE;
	Mon, 09 Nov 2026 02:43:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQFMP-0000000H9Su-12es
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 02:43:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 43B3A61EE8
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Nov 2026 02:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F059E1F008A5
	for <linux-arm-kernel@lists.infradead.org>; Mon,  9 Nov 2026 02:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794192232;
	bh=Yq6Wg8dZm4uB3bJQCmf1miWvm1ABWBJ7TTfz/AA487Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FOJ0zh4zJXUQw4MziVD3+8dAw51F6b6lLyXVd/YcSGtZJ1UlcpBa9IuP7EEE2Ussp
	 MiD6q6N/pA+iXEZTrQi/BpeHnXOhpf9oR3xPLJuLxtonwwcUCmvpyJPNh/YVyyewap
	 87sSEPx5drY4YCIFBfMJmlEqUO7Z2v5aUEANUG5iwiqyWMHgDmdF0fiiXfcsUYRK22
	 hy+vXP5RcPIC2K26wbgfVeyImwX1pmqe57yocWa6N+7lIzQwksReCyjTSRjVhRTjFo
	 q6F3dlBIZQC/Ksbh0CM52+fKp/w9yP0ZgQ0lpA/BJuOdjF93lhrUOA4bEp5UYpHNI3
	 tKHt+PLWdZr0A==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b57182c4c6so555637a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 18:43:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHVjl5CaxsgnvyQx3TEhtShQ6BO9B3pGU/KtroZn8DPDe3XSBzFedOA8MdZqJ6X/TxhKmS7QdaaO4QI6tFx3CrC@lists.infradead.org
X-Gm-Message-State: APuU4Z93JOfFMm1JfG6H9KYcq639wcPcDL/ITkGgaX+2BhsgAJ5bMrNC
	0HDeL4OBQo2DhdBP7ydhSuywNzcl3bLvugLcMlHV93cW6VcA8MvjglegemvSPGoAdhGVODOLeWp
	Cjyjy9IVvxMNDiElrQ0XXLykt2yHPosY=
X-Received: by 2002:a05:6402:4487:b0:6b5:7de8:87cd with SMTP id
 4fb4d7f45d1cf-6b72249a189mr1729932a12.42.1794192230805; Sun, 08 Nov 2026
 18:43:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106084034.1579494-1-songwei.chai@oss.qualcomm.com>
 <au2UzljzfMaiL7F6@hovoldconsulting.com> <5df6771c-a440-45cb-bdb9-ca25b42287fa@oss.qualcomm.com>
In-Reply-To: <5df6771c-a440-45cb-bdb9-ca25b42287fa@oss.qualcomm.com>
From: Saravana Kannan <saravanak@kernel.org>
Date: Sun, 8 Nov 2026 18:43:39 -0800
X-Gmail-Original-Message-ID: <CACRMN=d8OnSHZ=4DOmfWafwYL+8ZTGggrxdWV2-iTptEJmd19A@mail.gmail.com>
X-Gm-Features: AclHuK83znKgPlPm3mYNg-jihIjo0y5-ZXz-onGQXWzrK1htisLXcdgRQNPmioU
Message-ID: <CACRMN=d8OnSHZ=4DOmfWafwYL+8ZTGggrxdWV2-iTptEJmd19A@mail.gmail.com>
Subject: Re: [PATCH v1] driver core: Demote "Fixed dependency cycle(s)"
 message to debug level
To: "Songwei.Chai" <songwei.chai@oss.qualcomm.com>
Cc: Johan Hovold <johan@kernel.org>, gregkh@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	songchai@qti.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org, 
	devicetree@vger.kernel.org, Saravana Kannan <saravanak@kernel.org>
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

On Sun, Nov 8, 2026 at 6:08=E2=80=AFPM Songwei.Chai
<songwei.chai@oss.qualcomm.com> wrote:
>
>
> On 11/6/2026 4:50 PM, Johan Hovold wrote:
> > [ +CC: Saravana ]
> >
> > On Fri, Nov 06, 2026 at 04:40:34PM +0800, Songwei Chai wrote:
> >> fw_devlink detects and relaxes dependency cycles automatically, so thi=
s
> >> is not an error condition requiring user action. On complex DT
> >> topologies (e.g. CoreSight), this message can fire for many node
> >> pairs and adds noise to the boot log, even though it's primarily
> >> useful for debugging. Switch pr_info() to pr_debug() so it stays
> >> available via dynamic debug when actually needed, without cluttering
> >> default boot logs.
> >>
> >> For example, on sm8750 this produces 125 such lines in the boot log in
> >> total, 80 of which are CoreSight-related, e.g.:
> >>
> >> [    0.057190] /soc@0/funnel@10041000: Fixed dependency cycle(s) with =
/soc@0/stm@10002000
> >> [    0.057211] /soc@0/stm@10002000: Fixed dependency cycle(s) with /so=
c@0/funnel@10041000
> >> [    0.057229] /soc@0/funnel@10041000: Fixed dependency cycle(s) with =
/soc@0/tpda@10004000
> >> [    0.057249] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /s=
oc@0/funnel@10041000
> >> [    0.057254] /soc@0/tpdm@1000f000: Fixed dependency cycle(s) with /s=
oc@0/tpda@10004000
> >> [    0.057260] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /s=
oc@0/tpdm@1000f000
> > I reported this elsewhere a while back:
> >
> >       https://lore.kernel.org/all/Z6t45aOGDkotqM4Z@hovoldconsulting.com=
/
> >
> > Are you sure it's not the coresight bindings that should be fixed?
>
> No, Johan, I don't think this is a Coresight bindings issue.
>
> This is the mechanical result of the standard bidirectional graph
> binding + fw_devlink's direction-agnostic phandle scan =E2=80=94 it will =
appear
> on any SoC/CoreSight topology using the standard binding, and there's no
> alternative binding syntax that avoids it.

You can add the post-init-providers property so Linux/OSes can know
which dependency is not a probe time or initialization time
dependency.

A lot of cycles can be broken by adding just a few of these. It'll
make sure the coresight stuff gets probed in the right order, and more
importantly also does suspend/resume, etc in the right order too.

-Saravana

