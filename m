Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FEB606A334
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 16:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HIkeXwwU;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q1FiMigU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rHeTYVt7epKx8U1QUPkS+orCbcpKVStGZLbPdyQKEk8=; b=HIkeXwwUbBHoR4
	csA7db/D4nDr/9jYni/YAZOA+BwWvSsb6+hUg4SI+S5r7hxjFH+kLA97b+dOoAekeLzbcg3luTu/p
	4kU4c4BfgZkW9rpF1uSYa9VaFqRhjNjI2oNxEbJKrkAkEM/uN0u9Ocrlf6iMdhBeodebvTy8PNrA3
	XyoWEnQ/Olz8SFMeoPSnpLAABTHoF0R8nioBtwlqcB4H12ud8jPPo8zO+1mkEehAGMwRT+BlWH+YT
	aIIg28H/CTN+pVe/xDXnpAt6jLsMtwjRqyeEORaf/wvXIcucKLklDzukuW75gUCYkJ5BjCgXzU5NJ
	W+VZ3FaosaGVLGbgEwRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURUb-0000000FYpg-34zO;
	Fri, 20 Nov 2026 16:29:41 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURUX-0000000FYom-05ta
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 16:29:39 +0000
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-99b49d6a5caso343072241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 08:29:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795192175; cv=none;
        d=google.com; s=arc-20260327;
        b=DaisRCs+LCB7Nl/xJV7uZMA9jMc9eeEjCfg5qT5BVLbZSqEp2OeErVgrMdw8x95UjQ
         gcVGJHqHY4kbI+BJ9+keeYaYPoJchMWeGAyVU1BpGOQTp/MyC9HNvJdUW4eg70zzLhOI
         29wdt0+8/ciHCufc7kMCbWmJyv50hS0h5tKlIcO/MtVsLSveCMO5gnWSDcpYTKtjGCm5
         8m7zokKZ8LNBV3s1PEg7yiA0J8dBnc5bZVWU77pOkTvgNpogehhNKScAL0E4RC3dRkHg
         SIakQbtD7UZOUQsja8NSJQrYPxzqeMnL8aHJYY5gUZIAVZIEaeTABTBsGpI6/l31S428
         yz6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rHeTYVt7epKx8U1QUPkS+orCbcpKVStGZLbPdyQKEk8=;
        fh=xrZJ4Rff7+a5ehUejj1UqApw0OL8N+yaLq9LWQPklm8=;
        b=Wxx1diQqiG4ELs6GgtBs61sUghTCBjtc7caqperV8cGHDxFEdgWj10x7aumPd3RV9n
         YRDWleM/CRA9cZCSgAGD9tfw0Hq/hPhXe1gYdShyL7VsxefUmMoGSWVgFa6m1uJogSHh
         hWo63aTHF3hECzot/dXeFAizgs8S/gv37t2IbmZXIc7mHkaK27LbUrCI30dPr6RMEn2f
         TWYM4x/I1xmr0pOBKvfmeAh9A0KlKlmdvxmJrxJpltAhZXyi19JWEfKuMCsmTusXU8cT
         CgbKwcscWdwHzXnBKzLgL3GVjKT/NTM6vybmiKHMOOSvXFcO21Dths3FGMtnbcdMilfX
         SnFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795192175; x=1795796975; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rHeTYVt7epKx8U1QUPkS+orCbcpKVStGZLbPdyQKEk8=;
        b=Q1FiMigUeourcsWTn3V5xWSeCteEItqyW3YkTGfV1s5BT/AKngwyFoKpG3YGyhNmHa
         NZkL0nT7NyLhVouOwmoQuFtio3rfRUvPsB2Py7mJj9eL3uQ24PyuykYdjukNPHG8eNUB
         /WhnFFOfhfzkCQvz8dhko5/KRM9UnG2j3fnPjG52a1OkmYyebVwZ2MHKKHLTz9FxhWMo
         /5yi0OHBE+Y56qH1wlOq2XWgmDe31jS9x0jsX1q4svJWmqnKWkvQFoRh+ydRa2rkBone
         PheHLgnIm9AOlmOQD0NuHEqZITD8fpAMYOETe0S3NqDo9bcfkebzKGixaI3XL7JjrinM
         1iQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795192175; x=1795796975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHeTYVt7epKx8U1QUPkS+orCbcpKVStGZLbPdyQKEk8=;
        b=a3a5IltReVxEcvy4HVRZ68xAqM5GxQKv8+ZZzwx8Dw9T4KH/CfsRjeH1tPXOjUcWf0
         1uWM/C+YS9mimkUL4cxKYF05ulSt1pAXwPD1bv5rKQEk4UbUzoWec1zfqMWhmtNTLCU7
         q7yliKDw4w5iHPBivVDLdEU6tFWgNwh5JECU7NXGyBOWxEBhKaOQxhuit7Kx32NitrjO
         uMvUvNzfkUJghW/RrNSSD+gXg7kkd85090mWBsSzVh7mPH67KlWrRMjK+uiw/eEh5gNx
         e0V580DXVv41H95M8edKO32dHGIBuxGJeC+Z3E17Bj2SJb+BZ9Po+RzxerJBDGtqCmCg
         7p3A==
X-Forwarded-Encrypted: i=1; AL+hErFc7HlQM6opBA/bXvk1n14tYH07nchMfHTCj0aDu/MzhL/5zWzNzun9Zby2/AdtDo7zJoj858euFmUKB7YznyMg@lists.infradead.org
X-Gm-Message-State: APuU4Z9ORIO6ZAy6dVEfdZ1o5CNB8y0MNStDUy5OOaGMFwNqldIzRXb0
	H8tp198h/qMquM2i66celuiIPLu97KWSWKSU8kQJej991wg3sYnN1Whc7l68xYse5zxwXaSEHSm
	t+hang6CVg3LUPXjXp0ywEF8w5JVyZTo=
X-Gm-Gg: AZFdTZeSBO81JnZrKkkZhU2q0jczdbevfBLpkVS0ajoybGPCbWcwzHHwci9piMLM/vO
	I5zA2uUKypIs8aV0ridfHq04JuV3E9bwuIgHYlKXRvZJ32rCUXpnDYMzKtQRwXguTcRxc6r4SiA
	+62DSLvJCl/GNXrhWHLhHXhfllpWH9VbdOalV7X0M0vhGmIk2HfF8nUaZgaWG964+LT3cjTLsUY
	AEtaH6yObHYISMaMn4Ymu0s+2VV5AOjaK8hikLFqmUG3LxySrvHYAx8EkXMiPhABEHiDEfDOhZW
	noUdxvcw+sVs442qYrfz6MRFszZaFqvsnvvIADhRDhWG+MTMdFRhtpEuXqKevaOfLtTZ/+8N4B6
	jhwu7i9cbEGFIgcTTCq8u7Q9heomqL+JdXuJpf6UKvx6p7bkwz2CI3j0c0uZy9seDx5NZEQ8Ux7
	BIichCb30mAOBkBffS0qhueonHN7sXznRKzpyL1LmqbSVCQr7xFHgRO9hjfuZYtT1eDJriUfnu4
	wcKLhEHyBDnNmfBClZtAlqqVp/hlUQ=
X-Received: by 2002:a05:6102:c4e:b0:7d2:cddd:935a with SMTP id
 ada2fe7eead31-7d739452145mr1508690137.16.1795192175491; Fri, 20 Nov 2026
 08:29:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120-submit-sun8i-rx-features-v1-v1-0-5058fecba6b3@gmail.com> <179518906382.3291.11090310469167736540@kernel.org>
In-Reply-To: <179518906382.3291.11090310469167736540@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 09:29:23 -0700
X-Gm-Features: Aa3M54rxvRHQ1SE3EhRHaS8AS4LHAflcS3ypLersCJii7Z97A0x6odnETYQXmBU
Message-ID: <CADvTj4pcueutmeCv8VZVSEKDZf4F0wekqYE3hhaJf3eWdTR-Dw@mail.gmail.com>
Subject: Re: [PATCH net-next 0/2] net: stmmac: handle RX checksum and wire
 errors on sun8i
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Ong Boon Leong <boon.leong.ong@intel.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	LABBE Corentin <clabbe.montjoie@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_082937_070765_847A55AD 
X-CRM114-Status: GOOD (  19.20  )
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

On Fri, Nov 20, 2026 at 8:37=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

This series came out of Jakub's review of my earlier dwmac-sun8i
patch [0]. I found the original issue while testing on an Allwinner
H616 with an AC200 PHY: the MAC dropped packets with a bad UDP
checksum even with RX checksum offload disabled. My patch fixed that
case, but Jakub pointed out that a bad transport checksum alone should
not cause the MAC to drop a packet with offload enabled either.

Jakub asked to see the full fix before deciding what to apply [1], so
this series replaces the earlier patch and handles both modes.

[0] https://lore.kernel.org/r/20261119144848.4ddd88cb@kernel.org/
[1] https://lore.kernel.org/r/20261119161151.5251fc86@kernel.org/

>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

