Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FFC606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 07:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WBA1goXo;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kCarSwNB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QeSYZZBSKoLuliFiah1nYjHZ50+xCIiYrRcjsFJbOlU=; b=WBA1goXo8fwTzY6pn/REkfIo3U
	G8aLjND6o7iO7VhgusFgQi7MNo6S+Yb6RlgE7sltUSNpHWo6uewVxkWP0bQFLYlRkQDr+Y/W9tg9o
	k6zmwzG59q/lAnHLnoE7NmwAbScy0qoNCmcHuanTFO914lBlFXaaRr6stM9SFWmmgWJZgZThwR2BZ
	Utytf0y4FHPQfpX9RljqAEfwCdfCZMP7MjiDUI5fWnzE8BKr5bLj4z38nFo2F/cF28HqjlyadkxVC
	XYhyT9eIz1GYf73k7g7yQ/+ti2y0IQpEM95wbS32gk6vzEOLzJuFdfiWv5qk0UxA9q0FYZslL555i
	i1ke476Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRm9b-0000000Bxao-1UVR;
	Fri, 13 Nov 2026 07:56:59 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRm9Y-0000000BxaA-3HZD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 07:56:58 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5c00c727a21so63703e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 23:56:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794556614; cv=none;
        d=google.com; s=arc-20260327;
        b=X9ET0QnSp+bmARyKKGwSm3DtB9dGxgyihvl4hwLbhAONarLJl2ZTOwDdhbCMyz0SJF
         MASbxyxlvqnesfgjpz92d5AZuU2urE7ad8r1WU7vrbc8vYpnTSUYLXQnCsJfMCrWJKFU
         OAFg5d0h0LnUxf8HWu4xXRdIh8e/Y9B3EQVpjii0m4k8EHYKiKuEW/mU+KYfis9Gnxl7
         CNL8asZ43E8kEmm1zUB2xpG4e/C4YHIM8KWN+VXjDUJSS0dkyEq91nzePqiiqt3LzlAI
         PKqFGAhMupzrV4lz6sFCI4oxg+xNrIL195DWpFm2GLdEJd25oobvsJFX7WnRulxXnE+0
         T9Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QeSYZZBSKoLuliFiah1nYjHZ50+xCIiYrRcjsFJbOlU=;
        fh=OoqiIm8Vq82MjEDQLv8Vdmaw7hlja1wv06ke9vtIkIg=;
        b=RgADCv51cL22kb5FBrCgqg65uFg30LX+qkC92E79+5tfwmJjDpsWc9jNMbpc2I0wHu
         iAkvHDICO7eKskdS8rqK1CjWPa68Hh2hxA/QP3WXNnifZ6z1/w3Nm94rGvJFGVgKreuI
         DwOEPoCVTHHClw70Z15OPM76PSHfJ9tDa0DTEVHMF/u5TNgrZ6uMY3zjN1Lp/XUSN/wT
         eei1dW0csTmraHW4/BeXV8zUO72t0xw3YuSbkfJQT2zSy3QKRDq/Xgr9G7ZbjDPbzLzW
         ThcTWDaLtFh78F06rVQAH1BF623Ieer8O2I/mQ7jSE1hiWLVEk2HbInu9Rul8PzdRrql
         /N/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556614; x=1795161414; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QeSYZZBSKoLuliFiah1nYjHZ50+xCIiYrRcjsFJbOlU=;
        b=kCarSwNBI158JpSvNkY+ibBn5toKACocH7GQbFMRdb3BqA5b+O5C8CFWWLfh6FFj2f
         VvjHio+S0O4uBCZpDUT/6PLeZJMOANm00MWthAEjY0atnGd/tZQflZxsrnHmcFiq6xXw
         ZgLfql2rjS+ApP9AQDcPc5NisoSNGuD9fgKMsm7k+r9mVUNmtZxFrUyVENiivYj3TGWM
         ejaCN+6Sm8QhkXXWHy/ZJg/wk+8Oz9/GXPmKwVbT5Ba+tfb4xkbfa7dbZiw60cr/I6Qh
         NdDsw28FzVTRQ3i2xukemc8rJMewbtkBHQebL+HzMJ/gEpxQiQBC4zU5rIp1s28jG8O1
         3Gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556614; x=1795161414;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QeSYZZBSKoLuliFiah1nYjHZ50+xCIiYrRcjsFJbOlU=;
        b=BygvdNnNzTRtTw9qJqMujffkohmyBDpOM9hda/wJZnSX1yYHvJtUCdRrIj26Qodgaw
         4XaA6dhgefgldPJcOa9CSXMCQI87rR//W8OXoUFTa4ebGKszyCl5nm6dkyYIbahFt8R1
         F/XmTSFiGxtIn7XsCElis7OHHS7t3ZRPRDokMrWgv2WBZp2OT5t8+ZGxa3VFDQRt0o0h
         8XM0mDNHf9fiIeJ+PP6jrwrEympAGWwXcgURxT4VRuNyPi3QQF0quDs4MjHT3Vfpykgl
         IM8hYtTolCPRuWTdEp3mvtxStc8M8xvjvZGOtYG9gQNVQ1sc8aHVXG6aTICUEa7skRD7
         Wwpw==
X-Forwarded-Encrypted: i=1; AL+hErE1K753GGUTQTdUY/ZyDQia7+dfs7rdd55dkAoP1buMTIn/McUaUIpTz4M+Z3H5D7b8A4B/Zq4VN5j/8mXOC0Vx@lists.infradead.org
X-Gm-Message-State: APuU4Z/y+ZHr7HDtZYKpGHFhM+qFwZiVFnnJPD5w+wpaV98yBS3SY3sP
	686bnfjf3AvRZxvWWJ3EpvFJX7MYaLvME6ck3r9OLwSBmPxPDBMTFwpJNnLcjQGivD01J2ZERZd
	iDV+gyvQ3Bd2KqLwGB9DzlUarjDtXdiU=
X-Gm-Gg: AYBFou30EAmXKb5L8jhA1epREYypoBTn2sXyQlJgdsI+4Y6Rs74kB8YVvAbDRl7uhRp
	n0znOCHw9ZmyuBDfE5LmKllg3eLlZ6v4xbz4UV1sDhIJgOH4Jm9dgbCZ0BaJBqJV//nnoLtNxaw
	VjILYL9ovdRaWhen6OftBOLMq7idsaEO6UGAUrO1PST63RTE2EXC3lPuWUo0aDlf6SkxzWCem4w
	cKpG6loIMnpEwPnakHRkhEcq7RxxJC8LuFjPK+z6F+4benmgIu02zUmYD+r8oZnlnaalCNatVTs
	9n0fLxhdPr9Sj3TyY6HYwICIHqBf/ou1XhPZJ6qGihGcop8DXfGlc7EywnS3ZyiongIlg4wtbaR
	RNKgKg6QrYVLg9LQiLPt8M8lZqta1QP3If0KFcKZ8Y3jaqpfPKSc+ibx7hnvXnMifYuFzbEg=
X-Received: by 2002:a05:6512:39d4:b0:5bf:a48b:7827 with SMTP id
 2adb3069b0e04-5c1705f074amr884635e87.2.1794556614399; Thu, 12 Nov 2026
 23:56:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-smmu-cmdqv-leak-v1-1-7ea8e34277ea@gmail.com> <avXBEbkBJ1ZMZ00B@google.com>
In-Reply-To: <avXBEbkBJ1ZMZ00B@google.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 23:56:42 -0800
X-Gm-Features: AclHuK9R-O6Gj916v_Gk9doDaM56nfSpW5aT6J15ATtqrTQAWDgJ4XngFSKQD_c
Message-ID: <CAEy9hNX8j9FUrZBOBo3aU41RSif3_MvtSQaq=eY2yXTK2yxJnA@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Don't leak the CMDQV device on a bad #iommu-cells
To: Mostafa Saleh <smostafa@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Ashish Mhetre <amhetre@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_235656_850953_16EE6E0C 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

> IMHO, it shouldn't be worth it
> to fix as the FW can do many other harmful stuff to the kernel

Agreed that it only matters with a broken DT, and it is a small leak.
I'll leave it to you guys as to whether you want it.

Arun

