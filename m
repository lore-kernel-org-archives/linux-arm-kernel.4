Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697A3606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 08:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M1TjZdBs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=R9WgBghp;
	dkim=pass (2048-bit key) header.d=tomeuvizoso-net.20260707.gappssmtp.com header.i=@tomeuvizoso-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=k9h80UJ8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6Tn6QZlBwdQy7Z++SGRb83hx1wIds9xXetCQNFKWLw4=; b=M1TjZdBs/PdEcz
	e8N6rkExWp0QVdUXh7nHBN8otjWxMWQK6YiORMh/HPUzpGEfWFpH0C7OyzxSD94TcHZqr3PdRD0wX
	Tk/I49vqFzmFzah18/xY8ElQNgSqJ9MuENPgfAOK7Qy8vhh/asfK1UbqVMXDwDxca83/IKcft9xH7
	xfn61rZGbzhRFsjgrk/nd+Jjpn2KHhKF8dw4fu3t2pR5b1b9CzFKWts7zJnreenqWhJkEuZxcFyVH
	bR/taph5y8zw0G/Oe3ziHomnWS2RtxSjgRO7ElaNDJb5v0tdKOqKT8jHro9hTEgv+tRBGm9g31iA9
	u+HKeS4VefpWogE529dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbUz-00000008G03-2GcX;
	Wed, 18 Nov 2026 08:58:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbUy-00000008FyA-0px5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 08:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6Tn6QZlBwdQy7Z++SGRb83hx1wIds9xXetCQNFKWLw4=; b=R9WgBghpR9dp2Z5AsBthrGc1+A
	INvnLkoR0wUXmJxHcaq5oVOod+evHS0aN64VJYF3jZ6398BpUvd0Q+33JEHQuzFbkvq//pqg3NdVZ
	uaN3x2RUACWVJP9xHg5cGqkINREmbQvTiG821LkrFDVlVgPaNXL4MrCrF5O5v01Q6h+SfDHV9MSJK
	oV4NmBmPm+BAbWCzceDBvnmgEl09Oiuy4IlJTLlViMUg8tZCBseFppkvbbamLbc8WjWELfpHm4B0r
	LvkgPhq1SiT/mYfpykkfRulT+P3P/FuPVlEMmIHWPN49GS1uPaSFvq3WSN8yFTxUj6y1NM/qnUCOq
	DzG+BK6g==;
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbUu-0000000ForE-2BAt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 08:58:34 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-930c0f9c1b1so85047485a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 00:58:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794992309; cv=none;
        d=google.com; s=arc-20260327;
        b=YDDgV0Yg62bhHW0snkOF4GUYRu/IjBZ0W6xAWCsSVdEfu86TLvTCida4b5aRuhq0Px
         CfTbyIkRz823KUJkgpyYPW7TAo5f9wyFoVBu4wDjM5r56L5jhwfbNDj0MWdp3xp2wTbB
         cmPpIcEI0Im2N8hk0J3kI10kavBLA/g3mqOd3vF2+yQ2Cv9ihW41dG7YPCviWi2TMzZi
         IMyDwZ+RkbPZPW413AufNKcxoleQ+El0SCapnq7MVI9RRlkCl2/dIRiX0CYfmhZUfLq0
         qrvhcbCi2sHjVY/p8eCQ71lpiurl1QlFchHeUGsHhVKtCMgHPDH5YzN4+eolZUul8L+W
         zeKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Tn6QZlBwdQy7Z++SGRb83hx1wIds9xXetCQNFKWLw4=;
        fh=efHXsY2GRMokj8VOmXC+ONM5DHHGezyKW68KeoRnjYI=;
        b=oTx+4ZH5C+9qOt6ElXfbhP7riwbrVpAMyRzRCIqFbyOKTfcWPzqsTN79TqqjzXIsTY
         mQfLGWt97fQhhMsXMv7HqHpgXLfSOnzuPVfBHg53+xS4LxTQ3DJXnbs2I+/ag43e+kIc
         j8i+q0WHZGtDiiue9ShR87qWPstbZb0mPDRYMtMs5dCTDB5Ro0q2gDAHPCmaEx/bKGid
         UqxjD6YP+iJgXGERzlg1QuvOOcSO4DqR5M6qnaK/mZsmqyNdohXlCI58qBw7hr5lHDWr
         Og4JlMKscWSjVwq1yLowAYM/TMMMjzjsadwA7fH4fG6dMkbQzFwSW68tgZflU8U9YV6b
         mmpQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20260707.gappssmtp.com; s=20260707; t=1794992309; x=1795597109; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Tn6QZlBwdQy7Z++SGRb83hx1wIds9xXetCQNFKWLw4=;
        b=k9h80UJ8r9dhIeNyczgTyTDOh35mUyx5GgDOtwHCEr3qkopYMahVV8KWZQbsR7XeoE
         xEcuLZcYpvENI30KhW4tzjSvpMm4fSTnYrpBSKPdkTF/fgF/fhJVv+k9dKKyC/WNN85Z
         fPbiEzFE2bNBbVnkEUi47+mTIElryc6Ygh+HqeS0PLjeT02HVKyMOTijfrK2CaaybteA
         9X4R3DxEpvgenBxMqWtXMDGdBTsWOc0hGds4txhbNHRUYwBH60Tv/npuMA6Cppy7I0cA
         M51jf4rp4z4SqSHb9KTGY4Av5zJpMjJgjoUiJnVwdAN7V07Io3APK0ljTmyfcwzwppDs
         WTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992309; x=1795597109;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Tn6QZlBwdQy7Z++SGRb83hx1wIds9xXetCQNFKWLw4=;
        b=smMbb2oKJKapwbPubt54fO/CM7B/i36M+4OhfoMaaR4v35F4sSkvzn+wNEVQLvL4xL
         2LgJibgFoL1NP3nF5cwEcndb+hWulW3rQ1XwpzE48jhSOMfdcoB2vvJBDIR65twa5VV2
         9vDFGa4DraXRw1rHOT3WQeqrwUEXGVLnls+wrGQ8wepyCTKVesQMqdaTvYY/lHIAigfK
         aMCyWAwKWLFBmqbdhC0nI46B2EC6Pmp6qBF6RFMtoqkLCp0SFw79UVD3kwiX/zNKrOTA
         82C8HJAmqihN7KyQ2/0dzVNp2Tjk7zxZ7y94uN4HnWgUNcYoe87hX9JTsp1JestQ80yn
         EBtQ==
X-Forwarded-Encrypted: i=1; AL+hErHMmkjpNn+Y9GP9BJUr2kDiF4vJlFTj2wS8KnjSUqoxyOECeXscVXBC3fNyueJarTYyiwW25Q6bojM3XXrdH8oA@lists.infradead.org
X-Gm-Message-State: APuU4Z88EbjIhMhpnafMq+yvUJqaIxet4l5PeEL84kdSkfXts5/IBHtK
	Q6vnrt1Yc0Vd1aIPPFoYNMXnsZuoJN/hUSxHt7iXRF+GhW1wZj6x3CjVoFqu6qsFEDffvPFd5R4
	Q6DW05MMdpF/Yfqfa95FtcSv3U5t57iw2yy3PWvgwAA==
X-Gm-Gg: AYBFou3n1msGPi4+0fAK/uSmSEj9kh/X2DHMwoHv5UbRqvICqIsm3t3LmbuPS1LCSXP
	hqi7KpOofeNyDygDDpcpagF1HQQpzTLlPcj5p9i7Qmg4aIjspFCQwyqLMpZq1EXX++4HcqOOyl0
	xJRPYSdywIdibHza0VpelZWYF/s1iKQXsJJNt2tfnM1Bw4+GyFvNOaOJP170cVbLTk/0ZJVCVsS
	8syetxj299jFnnXvkNVb8P6nyGj+NlCANd5MFE4C5GBgX1H1am+xsMo18vuDdkenwUdNhmit+Dd
	c77wcsSaeBrpMIa4AQs2LYPggJuVIimf2a9UmoBOdeQeIvbDO8gPQNNotF1c5A6pY6/TMdMEB7O
	iQHVSAdChojdJAmkmRAUU35lCP8hHmnxdrfSagEpX+B6PIOm9NqO7fkem+aPjyXGa9TzKTF/CAX
	DQqsv1sqRJSU40+WMWhpc=
X-Received: by 2002:a05:620a:8086:b0:949:8119:6702 with SMTP id
 af79cd13be357-9499948e137mr355118385a.10.1794992308643; Wed, 18 Nov 2026
 00:58:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260814022453.437-1-kernel@airkyi.com> <20260814022453.437-4-kernel@airkyi.com>
 <0e722f43-f08c-4636-bf3e-0dbe991bf6a0@baylibre.com> <72957827-fde8-4f4b-80a9-050d2f112316@rock-chips.com>
In-Reply-To: <72957827-fde8-4f4b-80a9-050d2f112316@rock-chips.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 18 Nov 2026 09:58:16 +0100
X-Gm-Features: AclHuK909rrF_qXtOz1nnqKagNl32jQy-qVgmtzBVAZUdG_WOuXBZplBLfDYBaA
Message-ID: <CAPsqS2QhAortoDOt9MBizTr4RCDhChr1xLF13NNTUYjyFMakhg@mail.gmail.com>
Subject: Re: [PATCH 3/4] accel/rocket: Fix the extra iommu_group_get call in rocket_job_handle_irq
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Daniel Drake <ddrake@baylibre.com>, Chaoyi Chen <kernel@airkyi.com>, 
	Oded Gabbay <ogabbay@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, LKML <linux-kernel@vger.kernel.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
	LAKML <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_085832_632797_6CB87D1A 
X-CRM114-Status: GOOD (  25.97  )
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chaoyi and Daniel,

On Wed, Nov 18, 2026 at 3:29=E2=80=AFAM Chaoyi Chen <chaoyi.chen@rock-chips=
.com> wrote:
>
> Hi Daniel,
>
> On 11/18/2026 5:53 AM, Daniel Drake wrote:
> > On 14/08/2026 03:24, Chaoyi Chen wrote:
> >> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >>
> >> The rocket attaches the IOMMU group in rocket_job_run() and detaches i=
t
> >> in rocket_job_handle_irq(). Calling  iommu_group_get() in
> >> rocket_job_handle_irq() causes the reference count to increase
> >> unexpectedly. And this causes rocket_core_fini() to fail to release th=
e
> >> IOMMU group, leading to a resource leak.
> >
> >
> > While there is a leak here, I think sashiko correct in saying this chan=
ge would introduce a crash because core->iommu_group can be set to NULL bef=
ore this codepath is reached.  That might be a simple fix.
> >
> >> Fixes: 658ebeac3351 ("accel/rocket: Add IOCTL for BO creation")
> >
> >
> > Wrong commit mentioned here.

I fixed this one when applying.

> Thanks for you review. This is indeed a problem.

I'm sorry but I had already applied this patch to drm-misc-fixes and
pushed when I read this. I have looked at fixing just this crash, but
have decided against it because we anyway crash in drm_sched on core
unbind whenever a client is active (no need to have a job in flight),
due to the sched entities keeping a reference to the stale scheduler.

> And it has been a long time since I sent this series. :)
>
> During this time, I have seen a lot of similar work. For example, work
> similar to patch1 is here[0]. And some of the issues mentioned by
> Sashikoare also being fixed by in-flight patches like[1].

Core removal needs to be fixed as a whole: detach the open files'
entities from the scheduler that goes away, complete or cancel the job
in flight, and quiesce the job interrupt before the resources it uses
are released.

> I'm not sure whether I should slow down the submission, since it seems
> Tomeu is quite busy and hasn't gotten to some of the backlogged patches.

I'm sorry about the big backlog of patches. With Heiko and Daniel's
help I expect to get it cleared soon and be more responsive.

Regards,

Tomeu

> [0]: https://lore.kernel.org/all/20260915041152.1725014-1-vulab@iscas.ac.=
cn/
> [1]: https://lore.kernel.org/all/18667b2afdcaae217fa1038f5348ab23ed756bdc=
.1794615323.git.gahing@gahingwoo.com/
>
> --
> Best,
> Chaoyi

