Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC66606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 09:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jCwyDK1Y;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bMJkxwBf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lYEphzy4ZTo14yzeEAHhxhKUuleMHJNSxpY9AD/9Z4s=; b=jCwyDK1YNDhsRU06UDbZgWJqzP
	TUFCGev+FBX38VAPRaakhvDTJNmjLf5yMCMd5gAcQ79Z9g75biLttOw9tBrb32KDZ0X9Z/Wg+3Dt0
	MB9T/K+rRwKY67s2nhbkyVGlOdJWPl8RNrtIkxlHLkVnhj541iMpuFxBpwGeQAsWvvVbK9Ogf7isW
	aK4QAx4PiUe52iK6bCXvSymLG34vDg4w21Au48bxUc9aLMN9VmWg0ig95VfHzCuJB88zmBo8LRq/b
	TWzVsa8Hslqj9bcFXBuS0Si4B4T1nqdwecAAIq5AKNQArzZU0ZLQPFoOaJrJvEp7TxIbhtY7JtVyG
	8s5hs2YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3c1-00000000tJj-014C;
	Sun, 22 Nov 2026 09:11:53 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3by-00000000tJG-0L1G
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 09:11:51 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-3adf222704dso2586891fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 01:11:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795338707; cv=none;
        d=google.com; s=arc-20260327;
        b=gzUFtBkyHoGpb5LqPC/tMNv1k/kxNSLJ9FG8wFUySsHypCcUP8N4En0Q5zhEBhWlVO
         WIB9/9BJ3icOVpkdhmqU3b9cxHtLLRoVLwi3fuTnCZJOt3KiGdAbqfW9yV0xBuRVLpou
         hJp89Izho8tgakfOCvPOoDPb3Fk+dRu0JXaaemHyY+YOmAjbiVFZPgc/mj8YEo8sYJQa
         unw/jvepRzRSW/ymhwWYPvJeIeluprN9HRYJcfnKvzVVoluz4zlwyuR8gUMNu34RwWv7
         Ls2abIZ6ZWImnO+Zk/hgrUl9zx0gj5fNAaX9sfxOj7hcO1B4BeDL9Eu+pgjjVQi2P99q
         jHRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lYEphzy4ZTo14yzeEAHhxhKUuleMHJNSxpY9AD/9Z4s=;
        fh=zp9/qSX6h9z42ZS74SrcGGYIUNUcjGApXab4gobFsIg=;
        b=H13h0+VOIxxQe5ZDGaTarjUtg8rPfUBFjbzQll2r39CGm1h+RTJKGA9TXBqzryJD27
         exeA8YUfT7egdtNlM68DyVhMzpzm2pkHa/tsjyadZBvQVOim4TifU6jx2un4QaucuJug
         XEkSwu1M6yIbl1KAX0qVVMbUYFbQBSQL4NytSmCdaZMztwaivgNezQoi1QpkADlOCyCS
         NPZoI4+LAv2ii+sJyufAa9iUC8X6so4FsxWPMxxZy4YX+GaQXqqHiFOATpk/DZHeatz8
         +xasXvHwycJVRUJhwgO3gmplOYPi7YEGu6QIPPGoS2Gi6hjO/jZ5lJQ0V/et1tq7pLkb
         CQFQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795338707; x=1795943507; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lYEphzy4ZTo14yzeEAHhxhKUuleMHJNSxpY9AD/9Z4s=;
        b=bMJkxwBfO9RlicoDR9DxIxAKHbF0yicyCZAEBHpB1YocQmIUtBe+j/XyRp4fZcvl0q
         60wkmwhqYAtfyejLGKG5DAbZkRH6vvTGwnoJRCu88WfyMEiXTTxBNtkofRTromNSeDyW
         j8i+ub/Q/8y0/aJQqpAz6mT2J5Pyv3xrXsndQBfoH6FVhhXO8MWPJFBZmgpGFfDMZDAv
         5VG/v44iBnX2G3nuJTkuUAHzMbJu/f36n0hTwrhE5mrBDubNRwKOFP55JkrnCJ+T/8fF
         iV3XHvjAt0lMtQJ2eT6LIKmZTj4KNRhKXpHTFo+Vk8L80qUz9xPw6fSMfGxkE34kekH7
         /gJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795338707; x=1795943507;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lYEphzy4ZTo14yzeEAHhxhKUuleMHJNSxpY9AD/9Z4s=;
        b=xRA4zV5T+HmnTfasC4ddtSXtVZW0gY3yiiGDC8fbSQ3yukrYw+3RWmG1kOf3YLcqKE
         UXfwfTGy6cA/H5Zz4UVBz7k+RsCraemk9ZJZ6zfjdl1/Q7SzVXoFlUrECoeirUx/i/J7
         6iVAywDh/f1YBf9UMuHvN0BWyJwZipe2unMMxCSZjzkO66BTjIqLgExi4EMAFh52M9A9
         iQ5dgA8RFgLzBVelG/0NBDRQQjNseb2I5ZjKxTtPVpXmasWYyGjwIg7i91DOZVSD9cox
         +FEJF03qiwf6Pdq1BVpx6VyIXrdDxrqypKuRNjex1Fmgwv/CUG8sJglQlW2duK+XwgI4
         DZ4g==
X-Forwarded-Encrypted: i=1; AL+hErHFKj084Mm+pt5P+rKHw/XbIcvmzmwhjOg2fAK8JWsiNv4ZishCJJp7UmJ+3DK8gc6sEeZEfWm3CF/0X9gKdY7K@lists.infradead.org
X-Gm-Message-State: APuU4Z+XuuSIAIKEuviVavjf6ZE6VP7dn7kkNZ0GCGuqq+QMNqYVO//W
	gLDj8r6GJQistyY8bolUEUiKXLBpT1u5l2orkPGymSYFgNPCtSQTDVfeH8bGWW2fszE83UnGo4j
	Inua1XVgOva6KzUi7URXTOJzrjvw/LJI=
X-Gm-Gg: AZFdTZcjRhC9WosIHlJeiBS7/DMuNPUXDOEashp7m3NWHps4Pz1gQuqCFSj+nVEmZde
	C9BN+U+P8auvarWkwlh6mfcr0teNn9pSz7JI/vWmOjnJMyEl5J6+/kMNwVjKsFvptxw7wc2e+/8
	h1wXQTwvfHrV7WnJmOwWdzuD4KK1TdmnR++Mit2fe0RiEapXmF42EcEBrjoPaLDO1Cx6K+mBbdD
	1hwK0GF26GKIJZLmOBRl7E9zSnMtT94P3WOGkFzny8M+L6b+MMhEHB3v984tBmcgcLeafWoaw/K
	wjodKFbOCAveR9SQflzJjJ/vKJ/Pw/Mpk2gbds1kvdWYwxpaNxPT40kF4qP6M2IzHeWFL6P7TmS
	+kZEGaHqV/HbIvbbixyRGfqP+gtP2pfK+2CrBwOy57Oq/eMLfnvJvumkh/2cTMpvx9+gzNPFi
X-Received: by 2002:a05:6512:4382:b0:5c1:57ce:d4b4 with SMTP id
 2adb3069b0e04-5c1bc75212cmr2114507e87.2.1795338707138; Sun, 22 Nov 2026
 01:11:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121-sun8i-emac-mtu-limit-v1-1-22492842d318@gmail.com> <CAGb2v65w3cVgxb_G38UgKEa4ErKLN4qiF05N3nmdJbmPeRRNBg@mail.gmail.com>
In-Reply-To: <CAGb2v65w3cVgxb_G38UgKEa4ErKLN4qiF05N3nmdJbmPeRRNBg@mail.gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sun, 22 Nov 2026 01:11:34 -0800
X-Gm-Features: Aa3M54rEVKMx6Ef6xvJSXV2IbIddu5RGXUJDnGgXRbNUM1fhz_Gu6V3X74W1H_Y
Message-ID: <CAEy9hNVJ5NzKQ95gxN6UWxsgy6HFMMFxGYZ_sutmdb0gL3qRbA@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Limit the MTU to one
 descriptor buffer
To: wens@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	LABBE Corentin <clabbe.montjoie@gmail.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Russell King <rmk+kernel@armlinux.org.uk>, Nicolai Buchwitz <nb@tipi-net.de>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_011150_145814_F853CE7C 
X-CRM114-Status: UNSURE (   8.76  )
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

On Sun, Nov 22, 2026 at 3:26 PM Chen-Yu Tsai <wens@kernel.org> wrote:
> So what's the overall plan? Limit it first to make things work, get the
> fix backported, and then fix jumbo frame (>2K) handling so it works
> for any MTU value?

Yes. v2 for net limits normal descriptors to one buffer in the stmmac
core, with the lower sun8i limit on top, for stable. The jumbo series
then goes to net-next on top of it and lifts the limit for sun8i:
https://lore.kernel.org/r/20261112-sun8i-emac-jumbo-v2-2-aca0cf23cf17@gmail.com

