Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3A0606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uCBNmDAg;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cyskekEA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vSzzZQXyjWd707+YEztZNfwhTEMbuMsIk3gAaxR7cCs=; b=uCBNmDAgYZV40x
	sEJPmDqsSzBBEukW8AYcrbukpqoO9wES9CuK6OyLyDsTqpA7QiMdhw9O96bWmtxjmuPoGJlP/2Rl0
	4H/1OCt7KTqKKdQyoZyydRHdCzpzRPv0hhlT0n1ja6SsxgJUHLcYCwR96IvUWjH3+pGSDjn/Ei4BU
	HrsbYGZWmVUXKqvI1/tkXiboWNP7JUF4AcaSxn0v4q/vTXi8vE9RUzBzqRVDGOfHSfioltxa9dfI4
	8an8QWqUjJrvhwbzBR52oDoaVdTLbp5jjsE7rwjsHGnLAYtLYeznitjQRlCGdNd2eYq/fVG+UqpwP
	Hsm0EfLFoTROIl3BVpmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRr5O-0000000CqhQ-1Kq1;
	Fri, 13 Nov 2026 13:13:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRr5K-0000000Cqgi-2n3t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:12:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2064962727
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 13:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1F21F000CB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 13:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794575573;
	bh=vSzzZQXyjWd707+YEztZNfwhTEMbuMsIk3gAaxR7cCs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cyskekEAdhtrPKmUr/gE2ThgA7q7NVKzsV4u4W4HbaBqmHFsDI2iN/hkL+YZs9N/b
	 UmV5t0iSJkFp29o86TmJIE2qqhltYZ1tqguxVdjr+5/KUzX+i7naCNolXlQgisd4gH
	 rQjalS3iELABZ/bnOO7VCoyqXi0A7DJ5EZLP088yRBUX+LtT4IiKQtuL7qwpKgjbvD
	 SOTzhTKhYAUI/2eECaWWpMGQnMGgRHmYKGveSMCrER0bofsJltyX3ycf51T+M2Y5kf
	 wufBl0gA8j0nX1sBNQ2uOMWEqTQl3GbMoJTWNOH8oI/KlxkAjhB2HS4jWd6jEppmBV
	 5FI604C/FopdA==
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-716b58a4365so1076435eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 05:12:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFxjD4McVf+hwoMnyEpanetTI6vM8S5o6w7r9ukI73SeKzrCCT8302HK6RWlwQ7bPU/PARLjQHDO4g3GQ8DzLVP@lists.infradead.org
X-Gm-Message-State: APuU4Z/SphjlWQ31BXE2/djkcCUWBE1vmQ+UvjOKupFg+tWe4m7kliHg
	GSuti9pTD/0xGYfqxkz28mKrw8Gvk5XFHzo58M7Fl7xnyPOhu2njR6BHxINNdpEwklqCxRvmzGm
	S/vF3B+GhW6y22sRW3Yal/ABC+dWXa9c=
X-Received: by 2002:a05:6820:60c:b0:6f5:1e7f:c65c with SMTP id
 006d021491bc7-71ab4f38fbbmr1236618eaf.33.1794575573123; Fri, 13 Nov 2026
 05:12:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113053221.3131068-1-wangxiaolei01@kaihong.com>
In-Reply-To: <20261113053221.3131068-1-wangxiaolei01@kaihong.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 14:12:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLkE7zweAY5V1zihorrHv8EL7LO+r8z+VmOVUTCesdGK_A@mail.gmail.com>
X-Gm-Features: AclHuK-XfwbbsThDWRKKp0Nlzp5SCGGel7-dOlgu3vEKR4VlZvcMoWFny-hIjEw
Message-ID: <CAD++jLkE7zweAY5V1zihorrHv8EL7LO+r8z+VmOVUTCesdGK_A@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] pinctrl: bcm: Two bounds fixes and a dt_free_map cleanup
To: Xiaolei Wang <wangxiaolei01@kaihong.com>
Cc: florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, daniel@dragonzap.com, iivanov@suse.de, 
	andrea.porta@suse.com, phil@raspberrypi.com, linux-gpio@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

On Fri, Nov 13, 2026 at 6:32=E2=80=AFAM Xiaolei Wang <wangxiaolei01@kaihong=
.com> wrote:

> This series fixes two out-of-bounds accesses in the BCM pin controllers
> and drops two hand-written dt_free_map callbacks that duplicate
> pinctrl_utils_free_map().

Patches applied!

There may be futher comments and/or Sashiko moanings, that
stuff is better addressed in-tree with follow-up patches because
this is GoodStuff(TM) that needs to be applied.

Yours,
Linus Walleij

