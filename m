Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815A0606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KCvtgAK1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IjKnpFNS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gBeq2/iCMChVmV5bVu8cy+G0EEsYIJD3BwRTb22K9Y8=; b=KCvtgAK1BlXchcd2MWyMX1wQ5E
	KR1Xv5QTFl78Bf1p1/52vBoMPOPgAnydgGBKvmX3sd6ikFTOlFqdg1vH/TfVQ6eMAGB1qK3mEEZNY
	qKSUTAnrko7/vziUwsjmD5vKCoOfW+JIFBx3H2kd02jznccnAstpqydwQoGsPu6x7yhgggXOmMH5b
	IArAqJy7NOMKi+bMeidO0LaCA2TBfF2fPHRG9O/Y+9+8fAtfRLuXFTYF81d/SSrjNN+29xSZli/Qd
	uYgufFHPZo3ypEsfqKq+RU1NZ33focVrWcMbzknDGJ68eePavuWzp1Nv88fWBz7mSq/s+l2MecBw3
	fb/qMSfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHz7-00000005YO7-4BoL;
	Tue, 17 Nov 2026 12:08:28 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHyb-00000005YDm-2wVN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:08:00 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6b87a240de3so349117a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 04:07:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794917272; cv=none;
        d=google.com; s=arc-20260327;
        b=aqzJ94d0id+zj2kpgSbh8exghEBXyogiWty065Z0pdkUs2vEXXg/OAR/JOV4alVLnZ
         S93BDj8xXEzUVwiVnbO5e40BV+g4oU8b8GZHXqNc5Adqbb/RmWJA9M2OhsyFj1uIXJ8D
         3YGEpw5ysnWgETBjBQqKDutTfy76sXEvJepUhbttaTznZn+AUyK41rVvWdTUybTPJgEL
         mS7xqvxJHudsMjnVgwAPISGYB6my+MWO4L8k5tx9HBm/QQdsNxU7uE1CKOqw3E4VxyUy
         uvFoll6lvm7DZBfkMz/YTUyRgyBdjOVZh0YqH/jwh0tl494gs8X210q+UrA7YiuKyIrx
         3tVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gBeq2/iCMChVmV5bVu8cy+G0EEsYIJD3BwRTb22K9Y8=;
        fh=T+ulIsbsOIzgCxpJOpeFeD2Q8ttdsH0Te0rsGL7+QE8=;
        b=jPNKtwOz7nSLEQWGKr2PmkYuikBB5wL6+iYgjYVWs/m+f4GSHQDT2y1bTelH+W716H
         IOsSSBxiVA0SyEEkPFtu/C0Q4HJ5kRVk7t9/Ekjn4SM6jqAFANoM/4Cy0LpYtVdOF/2y
         uTs8YHNH2kU3pXL3+u6lAtzaHJfnEyvIYAXWCqkVyozo2mbyIbtPd5bsctybU5Ln0N0B
         /J+Tk56DxIq49y6HhYdIZc/OGUk/kN4CisdSmVncIVYUByaTOqn9kEjPYFyyjRZvoBrs
         jv8I37E8dKCiiSzcr+8fZsOVCJR8J0jxxrgTwCGNvs65nybYaIDxXw8iMGNauWKIh4/m
         p+iw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794917272; x=1795522072; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gBeq2/iCMChVmV5bVu8cy+G0EEsYIJD3BwRTb22K9Y8=;
        b=IjKnpFNSJada6sPN2EeM6hXyFnjrzXF4401QuSvT5xoLhj4oU1ftcIi07xMFYVxUBQ
         bfUF34S6V0tvXEjaSbWxgCPSN1Fex7fUHN4sLLYmmalZDrYnCmsxr4bp71D8F8rU3M8z
         FermnKSmd9HKigM6t3Sxs1a4n6JKpbjzT3NvjiVbJr142hE0FJXl3Bu+LrbVvaWYAer2
         /6K0FcEQAU7+K/oLwomvCbsDenGYV21F+1cOltKHlqs9x5SbZDnT+azkCaFPvXJlLfXs
         wHuaWlM+Im/soYxwJjbY3B5IegsGf2CHiB0JMIf6rMShxatcax1vBftylU1AG/sW+lTs
         RHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917272; x=1795522072;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gBeq2/iCMChVmV5bVu8cy+G0EEsYIJD3BwRTb22K9Y8=;
        b=QyXQ+U3GLYnN+ysYpmcKJSM7bwGVnaO/XGCzSugFsRFwh6+7WJOZZ6kFWDTUoVlpxE
         SnwiNZumn7y0dcbiFke37hY2FbEErHAN6PYn2o31mn1uu2lWuZ/puka32NKHo/4q9/3P
         hN42XgX3zChv38Rvoh1/FUQS597Gy6+K1Gqdhn0IVWmhwGYDUKfVvHt0id88DeyU2K/U
         NG2QolmqRY3c6H9k9NlZd2P9j45/egDTtrZ2vT2j5x6NiVwdPJPhkETqNkJAwmp+I5Rq
         LFuvPUYVvcf5qpR8X3nViLODn/snbu30uSxL+h1fblKRQpKNb4xpiWuaDUtJqxIOkzP7
         SYGQ==
X-Forwarded-Encrypted: i=1; AL+hErEw4TUG2n8da1HbGhn8NKqMCg9i6Ij1NWkzEhp11DyjhkgEkKu42kKIoZtmla6O2UANEdJ3nIBE5l+FPEs3qVfC@lists.infradead.org
X-Gm-Message-State: APuU4Z8s2TlKKP0lxTQ4EaF9Egg0iv9plHK0AxCpYYWkTPyCvnLUf/Ma
	BW+A8xknpPmdgFW4WS+1Q3WQpNjwGBwZzfFsgtzwGCBWVWQ7ZJyQX6CXEXCPridVtWyF+MtwcGc
	4sis+kD9NZ07pTkCGEEdPtq75px2phkOH5g==
X-Gm-Gg: AYBFou3VknCSCVCdY9TqKM+tzQLiVwcTGF+ri3Q3wdomUlxtlUz3v+MBMX13AndZJ7b
	2GtOSvG+0PKREiEHb2L7S+GVZXyPnovli736PknEvMPadUb7nIJ9clzqnzU7OeDasjVl6HuNTIN
	h8OZcx0zWMuPBkORHhmQR1YnSjsIOhvioj08R+DycMEmI5FvIjInzYRnAgUKaiZfGwogiqbVSK7
	p+MKYWry40z2BN21mHyEIzyOKfkcTJB9G8Tl9CNzj4FeK5RTJtwLJZ4eYiRsT505TosXTWV29oU
	6KQ0D6UOoldorn+S91Qx96v+YO2vGUf5FctGg+L967qgekwctr2BuPiFX5f8C9HEYjzcampGKs4
	0pVUgWIUWfaml8rDTlEcNfaCzLzkIUQDKF8Y=
X-Received: by 2002:a05:6402:c6c1:10b0:6b1:d62b:a8dc with SMTP id
 4fb4d7f45d1cf-6b7c08b4e88mr7273282a12.1.1794917271385; Tue, 17 Nov 2026
 04:07:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117113402.728183-1-l.scorcia@gmail.com> <7fb43d3c-8c9d-43b5-b979-aef65f362ed9@collabora.com>
In-Reply-To: <7fb43d3c-8c9d-43b5-b979-aef65f362ed9@collabora.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 17 Nov 2026 13:07:40 +0100
X-Gm-Features: AclHuK843kgmezwD-dXfy2-fm2q_WSzPEZgRrKlkUSUYV45gRmYPefogu3Bgl1c
Message-ID: <CAORyz2L_NDcvj3KkD_6CPFO3QhX1dGWphc7Pfacif2x0n=O_DQ@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: mt8167-mmsys: fix errors in
 multiple-output display paths
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_040755_274139_8F5BED74 
X-CRM114-Status: UNSURE (   6.81  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> This misses a Fixes tag.
> Please add the relevant one and resend.

Sure, thank you!
--
Luca

