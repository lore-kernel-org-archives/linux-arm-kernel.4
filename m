Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3E660A2621
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y7uwJ4yQ;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=Ff+QzORU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tt+WFRdvrZSXnzZAVznwgbf/IavQw06AhCrvauaK6GQ=; b=Y7uwJ4yQVP/+Z9
	L7eUDxPFEm/uZxOnLPEWMp+dPiEwEfKaqI1xrRbfg4piomfhETdBCIWLIkPAxv08mYshtd1ZMPucP
	RLRy5deWYFCKurO8jiYUlGqFB8siV7XBQK9jA6Y1VsfpAsg8Z2tdPriohmPByB2Ll9oianySKF2rU
	IKq4Dt3CyyTMR0Oc3bduXG23XwQ7/s2JyUujsGb5cDdC5J9DK0VY1Flbv+jDUUsjG8e8WIkncLltt
	8aZrTakVbDRQLOF2rX0pJst6AAqqXNy2Z3JMZFEiBS06ImA/oluf2I7CBA47UexLgSNKagrxH34b1
	U8dGlSOaN8OhNxqB+Dxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUdI-00000009zFt-2iWD;
	Thu, 12 Nov 2026 13:14:28 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUcf-00000009yij-2oP8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:13:51 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so668994266b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 05:13:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794489226; cv=none;
        d=google.com; s=arc-20260327;
        b=KKbhNh/6xH/0yRUxE1nJhj0sbkCmcqs6F0UB4Oe2kwsCAKrSZAdp3rkQwmAJo1SHmR
         tCtSlFQeM/g5riaTrqC64IQQeoJtOyVHPPU2rdDO/4do7J+nFjPD+OSzrQTOv1JRETvz
         7rFzpnpnUw3Z2UP3jFQjPKpldYRvLyKv9frjTgvYMMbD+PFeMxTdKooOI7aXqgmYstac
         H8KFS7M/UdKu0hIBIYhaRj2DKqt1rOyS38NSmLmPmzGYuorm2gRZNTSermcBdEIV6zMD
         qWDjWsGUSZ+QXptDqn7tG9g7lWvV/dSc/jxuE5QHqu5bSHUqNyzqz4Gp+jAE4tmvXsUn
         CaBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tt+WFRdvrZSXnzZAVznwgbf/IavQw06AhCrvauaK6GQ=;
        fh=VOlaxayqmh4P9GPhpOZc9cPNQPRWwMOlkyoU6vLSiZM=;
        b=YkGdH0xMd7jSDtms/2pbwfAMSvWo7ROSLqg6Gl2nf8ag54MdtvvtaIZvgDEUCrD9x1
         dzX+BjOgrUonqXNrMFLADCJ44sO9wd4yTthkqFc/c7Gmj6dp38DVFXWzaZPOAhH9ecgJ
         znTGj2+TQsYiNuy+LAddhJjkQqvYV76umxk9+GPX8IwWmxR90KYcnnMM0NXuClkZZxXb
         dxViE/5wXmdcv5PEdibX67q8xsewLkboqVPhuWYZvKEAoXpi0hXeapXJnYJhb9tDVf8c
         3zPp6dT5rOFm9AVtxlw59WsujynxGm4KbxmwrMKjBdqUbDinfqAAu/6WRPVO2aatLtpe
         E5SQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794489226; x=1795094026; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tt+WFRdvrZSXnzZAVznwgbf/IavQw06AhCrvauaK6GQ=;
        b=Ff+QzORUkp9rfKHjHrD0+93KcUOCxSn9/hkS82Q3VVPGi5whIYPqzCvSrOVVD8JjYP
         oNS3pNdrFcLQJyhI4cjzav1z8VjYYH1vYvDlRU/rpvhYd5kFMutuEY3VSJs2EHfIg/z4
         WQBmvoupIVjKkLmv7VtadXexRsLD7g14N2cshOqa1IGkMDdNc3p1rCtaaJWYVUWZcXCr
         YU9TmRleaO9wdjrmX7GoVWKw5AHYO+wF62roMJb8OFwbqMxJ9KLbwdki/oznj6FHxueB
         4MXcOIWEhnSbIR9Avj0Xoa7gUEE6kzNMI2zt0yNWQIm37ZpWe2vmHMpdkFb3PKFj4ays
         46Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489226; x=1795094026;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tt+WFRdvrZSXnzZAVznwgbf/IavQw06AhCrvauaK6GQ=;
        b=c7nA0yUaiAaX/JhVA6NYmJFjak7udO9IOLdeJxJj3C581pfbJsZ/q4RT+RgbuTaJCz
         CnNDzJwoYDp0Z4jHt/bU10EX6Ui93Ujw41J7y1L2Dqf1f5P/FIleOj1TIA0MdAxQEgwz
         CpXTQO2H1qT3S2hROwMt7KtsbPijMiT5GqiWzjNkdx849BQ0q0GkgVWn7Jvn1rxyW9AJ
         0q8unbtXaHe+GQd67aGikkTD8ndJKxJLtayooyr7MsGx9ruw6t8ZImaT2AzyRdpefcfO
         MeloArsqWjvetc9QS6SxRsf+UQMVaIWtjFupq4a7/aX9i2m7sQv6DCyI1dKKohJ5ngAF
         +pPQ==
X-Forwarded-Encrypted: i=1; AL+hErHV5X+T68Hw/eNfeGfMxGhZD3eCeK/mRwTsqvX8BBtpdfp9BpK4gLYOrM/c7/63MDS+VN5tf/EOxWPUiIb5BZNL@lists.infradead.org
X-Gm-Message-State: APuU4Z8PLDWNr721kzHBzrPWjppEJFU0lEcDbJFYXg7UPoREAdiJj3jO
	yi7u51cUCtf6Kj2awevEdjC4dxxpV6Zq8jSgBQqbpANf6cQQl3KS3SCh0EdemnCsL9tQm3AfK8b
	WKtvmZWnEb5l0eKaDpUQGjZ7SJ5J9/z31IsUaNl+0Xw==
X-Gm-Gg: AYBFou1CpUtmuKhfl7kp4pXKRQ2X41S/4HeVdFFYVE4TptbwzZ8Xwy3iDyVJh+nY3X+
	0dQ0liYDa8gMr5InVG9Sruag3eAvwRzsdDfrd5FLwY4mkR61u0EOHJyQLF247htNVbwOiFEgTUF
	fYG5OGZGzXjXaz0KvNAuln/Y7g49Y4ERy3e4O3WEKU17DTM/PL+xlTE6MxtS2/4reGLlrB5Q72n
	Ai2xLLrw2tXU838t/O7q1QQTndvlp4Pmq4yXNN0x9D1gASXzzt60yp6Z7yqykQ0c4clGphLFYcF
	1MY6QU/GEXCQxmowWERXyPBX74KNMDqToErrgdvset0k4LGu+0G7tqvyuyrDbA5q0hjKzr8Hl69
	8R27xcgKC/Exea5SMc+v+yhuz5cnYcJ9yGfHHW3qxLZP34fyIPGz9IKM=
X-Received: by 2002:a17:907:2d9e:b0:c41:6de7:7dee with SMTP id
 a640c23a62f3a-c506685458fmr461873166b.7.1794489225737; Thu, 12 Nov 2026
 05:13:45 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111-ufs-rpmb-bus-v1-1-b07100e53f6c@flipper.net> <b2338a8e84366980f648b0e321e9f8edaaf633a9.camel@iokpp.de>
In-Reply-To: <b2338a8e84366980f648b0e321e9f8edaaf633a9.camel@iokpp.de>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 12 Nov 2026 17:13:34 +0400
X-Gm-Features: AclHuK83OfRmcNSAr3yNNJR2smWwrfyR_yt7neFWx9UxX0YmCS3qGDuhZxsxCk0
Message-ID: <CAKTNdwHcCA6taSrwmJ79KYSBREkOZgWrhcnCPG0M6=5XOw7pgQ@mail.gmail.com>
Subject: Re: [PATCH] scsi: ufs: core: Register the RPMB bus before adding
 devices to it
To: Bean Huo <beanhuo@iokpp.de>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Avri Altman <avri.altman@sandisk.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_051349_776325_47E9C9DE 
X-CRM114-Status: GOOD (  16.69  )
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

Hi Bean,

On Wed, Nov 11, 2026 at 10:43=E2=80=AFPM Bean Huo <beanhuo@iokpp.de> wrote:
>
>
> Hi Alexey,
>
> Thanks. The code is correct, but this exact failure is already fixed in
> Stanley's series, which has been on the list since September:
> https://lore.kernel.org/all/20260914144910.931518-1-stanleyjhu@google.com
>
> The order there matters. Once ufs_rpmb devices register again, which is w=
hat
> your patch does, two bugs come back: a use-after-free on host unbind, and
> concurrent RPMB requests that get each other's responses. Stanley measure=
d both
> with KASAN. Patches 1/3 and 2/3 fix them, and 3/3 turns registration back=
 on
> last. Taking this patch first would open that window again in mainline an=
d in
> stable.
>
> So I would prefer to drop this one in favour of the series. If you have a=
 board
> where RPMB fails today, a Tested-by on v5 would help, please have a try
> Stanley's patches. thanks

Thanks a lot for pointing this out, I hadn't seen Stanley's series
before, and it indeed covers my case and more. I've sent my tested-by
on Stanley's v6 thread. Let's drop this patch in favor of Stanley's
series.

Best regards,
Alexey

