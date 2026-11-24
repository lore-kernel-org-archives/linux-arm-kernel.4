Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0F2606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 18:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d+jYNlHj;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=MpRiwSiz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3cr3soCs/aH4Auc5veUlCs6H08qDugqKnqtBUy6DKyY=; b=d+jYNlHjmRmMsllSkBg8uhCc8B
	35U+h9TCadvzpjDaaY0POt/jGaCkIgLSaOSt3lMJvQCa5pMxGVOzfIGYgCopAIECiWlIdxEVHWlSi
	iwx5/tPlexd/lR47gEFu39XwCDwk1zjjiFfdgxeP/kJC6KFkZID6Y6auLZKRMmrnAaYPHn3xsl3vJ
	JjrdwVJsol33v4ZklBR01Kp6sBUE6gkT112LskrTrX3BKckX7vmYLReosb+S9FXNY+5T2EuJmGVW+
	G3aWzCwvNBikk3UY+BUGYtmm9Vay7dXQrKWzvVacw5JNEv4bk78xzPvJmRpt+JHZpwgXVVGnq0ZtB
	K3C3jccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvR9-00000007WOP-1M7I;
	Tue, 24 Nov 2026 18:40:15 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvR6-00000007WNa-43kA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 18:40:14 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so2535506b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 10:40:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795545612; cv=none;
        d=google.com; s=arc-20260327;
        b=rOL6VXskiLRDaoggIgi1Hmd5lTD6zA6u0/D8vDh07Qk84QImI/r5Qk7Pnxs+LEH4sV
         GIa3gziRxtvREMklNv0P095IR8gVo+FMnn+iSzdNouZ/ZSKM3FwrzB1s1kVZGRvOh01P
         iiDhdhSIJN4XBQd4bmMijecYd2U72acObvPQtMPLI+g5fDB54CGD0hEh2FIWT5suIiTp
         tePQ+n9qViQeoJrKWZZyiBZOn/E6PRiTkBGidpmXvjJ4LgmpqcI6aj8VOIha4Qqi3c9x
         kYa8eotFD7o7Ew++ASfhZkxMPe3cX00jJ11EBFztignDtYQCQh+ITES39K3WUelje/54
         8pJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3cr3soCs/aH4Auc5veUlCs6H08qDugqKnqtBUy6DKyY=;
        fh=4uC2USShRernPEoEZgIho2znR827QTtZ1iezunlgRwc=;
        b=eThfpLk0Wr/6LAn8KeAcA3gj+JbMn7I6LdUPOafM3UgFjN6cTbIb1OAWvJMLrfAmhx
         dllAFEmruK3Sk+VzcQFzJjR9GH43codcJKeHSLI77gPjGDGQ5p0XkrU1SLXjO13cSH60
         7Io73yhJ6c6aYkiMTNklnaWX728sFjgbSMl3UXMcuajBVTgZNu2ks5EptxKydLSRy1d3
         Cp0iEYqA8lwIsqFMYdHbWUn6PTBQS9DLxrPoILRglTGQJFK4QMOFPJF5tLQQIhcoNI5G
         FHZiz91sCk1eiHGK4jzwPFm/pqXG4STezeOdEiK+QNfbv+A0V8tr/opjzTggfzq01R0r
         TOxA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1795545612; x=1796150412; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3cr3soCs/aH4Auc5veUlCs6H08qDugqKnqtBUy6DKyY=;
        b=MpRiwSizpeq5MczaxabQ0Au87n3Z29nfosQ4IGmx2b0JFCrOG41guAd1E252CfShtN
         UYk0JfAPR8HqtuMMvmY6+dLV6g785WNoMJMk3Gp1H58vb+UZpjq7IrtPdtIYpkQrw+Bp
         uS2tlPgPqJtRJ/FavVQEPVybD0RY5xTBfVctT7obr+YdaH53c06+fUrNmSOM3hFsn3Lc
         2kG7rKTPHUmV7oQsqJGO9WdP6ALOA3Rv9BfEie3CTWzH5mSj7QtpJAznAH00Gzzr7bU3
         g9JmtdhatSlQvRjfhueguSRkmhHc0AfpX8Z9VjCRK66b+lYxWI6m/k7dSmsSfiNZn4hD
         rFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795545612; x=1796150412;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3cr3soCs/aH4Auc5veUlCs6H08qDugqKnqtBUy6DKyY=;
        b=gX18Nq1ffL4rzK4hMjbIw3xYh3nwWWgGXzDZhqe242VFl3bbKzm4CJ6VUmcFKFJiPq
         8eoq3/QbQOcu1rQbCBtJ8BajgHYibABAYYB8usH5V5EssHRt4vT+JCqaFXOq1ZMHyGxq
         7qHmh81Fl8hJ1tKm5V3EIUnxG8IoHlGCGbzw2jwTHTw+oGfSHXBrMnWQZc+YJME9GU6L
         LKi3jsjgiMGiWxf41P3vhX4Huy0ptK/365d+BXR0qrsiZvQJbC6n9AgWRsO13/iFDifP
         pqsUE3lLrv9iWuwbxTxHtpqm3O2nKMsBnQjZoTwkJw46rLhMbjrs4Fpij5T9Q0/8B+jP
         hFKQ==
X-Forwarded-Encrypted: i=1; AL+hErEABLMnU7lngFmr8bVI1EzKWdQEJLcpbOZNZX5gji6acd6uMYSlgVa94imrU5XOfjc+FHCLvKSQg6WQp1C/fw0B@lists.infradead.org
X-Gm-Message-State: APuU4Z+jXJgBsepWYskGQ7NqgEzNpPau31+DekWwzYp7qLJKa5h/eCyS
	EUnTE5n+/fChfZmD3ynoKSWN+RGfSxkyCeECLfLWzxd5/7TuKaPSkUcODYvPeWFwilels6fHSUv
	mNWsN7G368cT68qRNyFRNkf5rpYQS6horvriexAtrQw==
X-Gm-Gg: AZFdTZejwZpt+fl0CUwP1Bb1fbsTgwbrUaoTAfElwJttgk6BsKPpg7Vy+HBxglMqGme
	Tajr5UhDb0wAQ81Anj/agNWHWZfu5DC7ocEzp+THb7LFkuFA62THj7Lk8E2OhCFAg4xk0RHBqz4
	HnyTmjk0dbZntNTZzp3RTdAjPGOLWLuOCiMLUAT9xCl7z7Rk9Glg8UIpvkPtt/qz5htiBvfrDqT
	LkEvSqkknB6Bp5nsstkJNXskRYgz08JMCWrzqviTXzeuucqP6Lj1IzKyxmjD2QWo7RNzn/j9sZw
	pq7ZodiY5scWQObyE0gmP7VvwLJSJRyZasWbhC3Fm/6VWgD/66lNuQVOQudBNR+Ex/0Ol8wgm/n
	5XUDxrA8elIa4whVTWKJ4HMP8Ojf1UEFCM/gg
X-Received: by 2002:a05:6a21:3e04:b0:3d3:ae40:51e6 with SMTP id
 adf61e73a8af0-4014bb52da7mr14240670637.26.1795545611912; Tue, 24 Nov 2026
 10:40:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-34-angelogioacchino.delregno@collabora.com>
 <CAPj87rO9saEC34+5NiYK8xyZiNytrVgOcszoY5uc7BpL=M4WTg@mail.gmail.com> <14a4f698-8739-45c6-8904-496ac61e73c9@collabora.com>
In-Reply-To: <14a4f698-8739-45c6-8904-496ac61e73c9@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 24 Nov 2026 18:40:00 +0000
X-Gm-Features: Aa3M54qIEgHVmsqq4DxWvUflQF2v_NEZOm-dewWZxD6n7rtVG1aK5-HIk_WFDp4
Message-ID: <CAPj87rPtL1nDrEF34LTmQDr9V4GbX0s8SR3wwwWWp4r0yQ2hag@mail.gmail.com>
Subject: Re: [PATCH v2 33/46] drm/mediatek: Add support for Display Controller
 exDMA component
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_104013_071436_A3EB3384 
X-CRM114-Status: GOOD (  36.97  )
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

Hi there,

On Tue, 24 Nov 2026 at 15:01, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> On 11/24/26 15:28, Daniel Stone wrote:
> > On Tue, 14 Jul 2026 at 12:45, AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >> +       if (!pending->enable || pending->height == 0 || pending->width == 0 ||
> >> +           pending->x > OVL_EXDMA_MAX_SIZE || pending->y > OVL_EXDMA_MAX_SIZE) {
> >
> > Definitely don't do this please. If exdma is asked to do something it
> > can't (and I'm assuming that these last two checks are intended to be
> > on w/h rather than x/y?), then you need to reject that in
> > atomic_check. Getting here with pending->enable == true and then not
> > enabling it, is not OK.
>
> That was done because mediatek-drm isn't in the best shape, and atomic_check is too
> late for this check... adding support for those components is done on top of a big
> restructuring, which still is not complete, as the entire mediatek-drm driver can,
> and needs to, improve quite a bit.

Hmmm, too late? I don't quite follow - there is the layer_check()
which should presumably stop such a state from being generated within
atomic_check() - is there something I'm missing which means that this
couldn't work?

> > Relatedly, most of mtk_plane_pending_state should be deleted as
> > duplicative of drm_plane_state and it would be great to see a patch
> > series very soon to clean that up.
>
> Again, I agree mediatek-drm needs a rather big cleanup.
>
> Lately, upstream has been a bit slow in reviewing etc for many reasons, which is
> why this series has been there for months now (though things are getting unblocked
> lately at least for this specific series, so that's good).
>
> Anyway - let me see what I can do, but I can't make *big* promises - the only thing
> I can say is that further *big* cleanups/restructuring is something I can do in the
> next iteration (after the partial restructuring that is done in this series gets
> merged, but definitely not in this series) whenever I can find some time to.
>
> I'm all for making things perfect, but I only have two hands, unfortunately :-(

Sure, that makes sense. I think this series is already a really good
step in the right direction.

There's still a lot more to be done though: if I was looking at this
as a new driver, the state management alone would be a hard reject
until it was fixed. It looks like it was a pre-atomic driver with its
own state management, which then had an atomic implementation bolted
on in a way you wouldn't do it if you were starting from scratch, that
has then had three different hardware-programming mechanisms (shadow,
direct, and CMDQ/GCE) pushed into it.

I'm sure there could be more to be done with the vfunc forest and the
way all the components are modelled. I'm sure any specific 'why not do
it like this?' suggestions I would have would be very wrong in some
way, but as an exercise, sit down with someone who understands display
hardware and KMS drivers for half an hour. Start by spending 3-5
minutes explaining the MTK block & routing model to them, then go
directly to attempting to explain mtk_crtc_num_comp_planes(). A lot of
the questions and confusion that comes out of that would probably feed
into what a different design might look like.

Right now, it feels like the top-level DDP implementation is so
generic and flexible that it's extremely difficult to reason about and
think through, but then it's so abstract that we end up not being able
to use any of the hardware blocks in anything other than passthrough
mode, which is pretty much the worst of both worlds. Hopefully we can
come up with a better path forward that means we can support more
hardware and expose more of the functionality as a nice present for
next Christmas.

Cheers,
Daniel

