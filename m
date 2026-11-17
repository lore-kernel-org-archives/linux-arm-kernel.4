Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B2D606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 19:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YE0fprvJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zcg1M05H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vOL/Nw17lyMhYB+phC9VVdqxP1Km2LT+SN3+8ZuNcpE=; b=YE0fprvJ+aWKr1E2i2pyJrQj50
	DGCq1HHohopgd5+DVhbcFcP3rH1VLNcidYqTHqODaglYGTVhx4mU24Pw7ieK1rn0yHosh26TAdZkE
	2c6Iz/hcHhKVu09tstSKd6cWWj3J9yeQ3NGR0O6D/+jiQzvNsEUpWyByMs3qsnqvuTbHodGXoVMr4
	Fm+lSNLdLw3HXSaapEGh9bEVqVgKv3FaoZILZJkMI9diEIw7K3aAXyTY/Xz4hbBb07uLmBUJ08DVu
	OBpjkasCApp/QUWlxDzCRkKfD5pyGpzj+3LUUEzZL8DvB5bkrfv7PioKPK0k56QtTNMK1/MOE7gUi
	DRCTzOYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTObB-00000006pbT-0zKB;
	Tue, 17 Nov 2026 19:12:09 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTOb7-00000006paL-0fI4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 19:12:07 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so304026a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 11:12:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794942723; cv=none;
        d=google.com; s=arc-20260327;
        b=EHusnL2wvKbe3haKS2XB6j1fPHsYGFI72BRWcLe870PrcXohr8tqWLD72rc7ul2AFx
         PLzEg8wv/H0U5/hNgl40KLAB7aMTV6HdLY4TcVO6CpxB1Q2Nap2VGuqaWGO+lfpVj6X7
         0VGbjlDIeBTMOD2cGoG4G/owb2pwlyR2oSnd9COKBdq79mTn8NTsJXug3q0uQISgEbuk
         ikNnZyQMW5SELeTb8lejd5caNo6omdSXPOKe5J26pIQKAxpXdk6UcCzYBlhLFuxk1P57
         jRjS5vXrn/1cFLu9g2Vwo+gaonI211JeMdnl2U2Yw9vmFinU848eyjyVlG41g53lHIjN
         bGHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vOL/Nw17lyMhYB+phC9VVdqxP1Km2LT+SN3+8ZuNcpE=;
        fh=Fw+eUcM7Os2BJJcD10hQfFnMMqK5Uldxx93AOBH8dJI=;
        b=SQDxOBrLjJnO0+eoaTUpdXoaXbyJF6QfyyHpMpZpu1XrjNkRFcCDjNI8x/o0V9BoMD
         sIoWtgUOd3Kv/XDMJSUPpgM6jmdzy6ee+f0QzBu83xb8YdCUGItIBHXvMWOeo9rs4530
         099aPpJ4UJ+w+J4wCmKQGy3mSSJPnwEnLq89hKe2EginulPEICnuSUkqsMJ/Ot3K6b6u
         EZSQXqYSUEgJVmL29fVr1wkhITTduLEUEw0OvrzzHZ+JWh67FyEx1rOnZG844Kw9iok5
         oC9nShHqQSJSoNi7IrJ6U4IecZFosX7egsyHZJeNJ+bsCdBwH1cveDI57OXjAgO1gaAU
         bcVw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794942723; x=1795547523; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vOL/Nw17lyMhYB+phC9VVdqxP1Km2LT+SN3+8ZuNcpE=;
        b=Zcg1M05HUYXDtNS5hkvF65fcFQc5tqhpsOXlQa/Rd1aNYzaGyuTJEwQf0Q0tdeMZIx
         msShCAREP11nT4hTIB7pMk/zqIv5gNQf/eSg9N+UkPTlcT8xzp9TrxG6OyJNDIklNPVH
         SIWcYSXo0Iuilz5ih06f5KI0qjxWYS0gLC9EcaVkg8hbLLeeRs+tWBlcnD12tC92YIxl
         J3FUodyabfNPxlTxCYai+GBvN4c1wD0jgneO0UfNvVUFEoqRoIuJOvd7jqMEviv3UnD1
         VdguAagyyhxW7DMT8meA7NChuns7Ny8Cix74gX574ExoE++ewWRNDHbyl7kvwSS+MQwX
         ncUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794942723; x=1795547523;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vOL/Nw17lyMhYB+phC9VVdqxP1Km2LT+SN3+8ZuNcpE=;
        b=adtfWShScoQ1T0fvlWYots1TTjSN1Za26Xtybmv2b1phOYJVxde3eQUKwNdF6aokZM
         Vv2efeiqpGS0L0ZHjIV77uUWHutyH4g6JhPCmjCwOVOhmN9hRsW23SkQNGHPr4Rtof9h
         QVpDzGL4PlJQby3C29q6dhzDX9/MsQtsRINDeqMBAj7yg1h9GCzt3IuWtANJOcKYtD88
         jJKcs50Ee8dEuiYa+MYUu93QNv0/ZlXX2241NNwJofPHvQni/mAxDlKn4gohyJyZgMj5
         GwHAttJQLBY5FQrbi0tO8FEKSTHlltKZv7/WzEn7HnLSo2zDiaHRzrz9sQe+j5M0pkJB
         hd1w==
X-Forwarded-Encrypted: i=1; AL+hErEAA5jJFa07ESaUdSSpfETuusS7Ozc+rAcqaJlUi7vPBQXATwvfXkmsCO3yZlYZ7V+7c8facPLXegUWyJZR3CI/@lists.infradead.org
X-Gm-Message-State: APuU4Z+BXI3nzKFkYbE404lyfgzbdFK/XXmAvkGcbgZBLy7wL/T3Yx1X
	TBirqiGqAJDhPd6ItvmT+Ywd8Gyu63tS+hdOkXPWDW+oTLPtDPwTM+uTQSGhpCBvun6MYVzMQeS
	ft05edTTkXA09r80/TasKYmjFfqLS43s=
X-Gm-Gg: AYBFou1h+JqyqNolsHIeIqqkYONb/HAgpHdR4cnCTOCz6n+aTUWLUuUDt6o6WKa5HZH
	qSg/Aj7OgBpd5jg/fsz1KYX91phkGnV2IJRijDEt6gujbJtBmBC7Dpx4RSBla7SAqenci0Yp4M7
	+iLtZJnY6zxlJMzJEIIM7AZTiifeFXjcalzMuluxzsnVrYTfzryotjTTTg5H8WBF/TWoz0fpYHX
	9gYbT8dy1BM1XY1BxXH4YukU9+RIOwoy4cP0SHVxoO0bgpQ/JirQFwJe8UQXdF0yr9dj22/4pSU
	zAcVCoUHgxedEgfNn4aZRM2nxNL1WoDMewn1j7pn/5KBnWl25/h11Vot4aITqEu8pSYeX9Ai3FU
	EY5F8SF9Il0qZGvq+lrrIj76UpMYxJCijDC0=
X-Received: by 2002:a05:6402:2805:b0:6b8:7775:515b with SMTP id
 4fb4d7f45d1cf-6b887e52cc5mr201512a12.8.1794942722510; Tue, 17 Nov 2026
 11:12:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921113914.779393-1-l.scorcia@gmail.com> <20260921113914.779393-2-l.scorcia@gmail.com>
 <3701981f-cdda-46a7-8079-de5479ae9c27@kernel.org> <CAORyz2+wF=VDTFkRFU7jBu-zNTW7T8mnPrJZAj8ZVD-Yyr2b6A@mail.gmail.com>
 <53298044-3595-4231-a498-d78052799727@kernel.org>
In-Reply-To: <53298044-3595-4231-a498-d78052799727@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 17 Nov 2026 20:11:50 +0100
X-Gm-Features: AclHuK_tAaAmV8XPp2n_nIuVB_4g8FKHhKrmOBsZ4DZheY4_R5_9zza4TO_AcK8
Message-ID: <CAORyz2J9HrKr5JU1rigB7apEUpHg-P_ke=STWz-_sn64afqQgA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: mediatek: dpi: Add
 compatible for mt8167
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_111205_234284_4E70F932 
X-CRM114-Status: GOOD (  14.11  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> bindings and DTS should be complete

Thank you for your patience, I understand now.

According to the current mediatek-drm code, aliases are not really
required unless there's multiple instances of the same block type [1].
On mt8167 this only happens for the dpi1 block and the rdma1 block. It
should be possible to introduce main display support without the
aliases with a couple of changes:

- rdma1 drives the secondary display pipeline; it can be omitted from
the DTS while still having the primary display pipeline work;
- dpi1 is used to drive HDMI output (not upstreamed yet). I can omit
it from the DTS for now, adding only the dpi0 node.

With this approach the DPI bindings would remain as submitted. Once an
appropriate mechanism to describe the blocks' indexing is in place
those two nodes can be reintroduced without having to change any other
component.
I have done a quick test on my devices and the approach seems to work.

Please let me know if you can see any issue with this idea, meanwhile
I'll run more rigorous device and DT tests.
Thank you for your help
--
Luca

[1] https://github.com/torvalds/linux/blob/666539eecdf4db623f5e3c3e55cf9f2dfad24aa4/drivers/gpu/drm/mediatek/mtk_ddp_comp.c#L566

