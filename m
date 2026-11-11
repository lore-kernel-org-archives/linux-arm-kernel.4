Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB115606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 03:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GRy7ti7R;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TG50vK3i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2YMF3SlM0rXsvzXJewcfKGam1OgjAg5d+kC6XMSfugQ=; b=GRy7ti7RJvTFy+y58+Vx4h/Aal
	FJ8RGpqZiBVBEzO1EP0WXoS6aJCMpfqAK/cSffMxwCa2mKR9cqsuR1p21rVRRooORrllc4p2eC5iv
	vMyQr4Xvixo9NOlYqXL1ruZI8aumwA/PRfQ3cf24SYOVJshZrOHlvlowWGLtnZv0AkB6e/mCq+mwl
	/rTrFhzp4wAuNCQgijXpmpIMLuRPCDFqS47BsksEMZZIRDtPJogbWYAYE41haBmfMZFmFl5GiHMPC
	0LkVCcf/5D7UtccKqemTZnwCTls+d0nQTtqX5GbLcfYxZGozMesOKh8E1qusNoDuyR1NO6Jcz+/6F
	Lha0tLlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQzKf-00000005a6c-35od;
	Wed, 11 Nov 2026 03:49:09 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQzKd-00000005a5I-0tYJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 03:49:08 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ed08b07213so11441415ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 19:49:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794368946; cv=none;
        d=google.com; s=arc-20260327;
        b=cTjBoVFla9OfgVzNwhs7dMh0nlkH2MfrLPpUlIYH6le9TOF1yINBTwnXw2DkqqbHt/
         Sc7JP23zRFJ2hlQm/QZjsaLmCysT4Ez3aYWzssn6vIriuargpXppJXr3W3BALiKYaL3v
         xMk6PzpP9DN+BW76HFOB1PPT9KjbslIiVnUXK0kKKAqX2MU6w0Jq0fA3ZAmmV0QdKDKh
         lnCSCeTKGRtf+x7a4eGsgsbYn35EI8sKrlLR3hoNPf9DoJdfu8utBy2oSExe0x8fIcH+
         7g10W6Ortggnj5CFfk7myYz1bi/nM4jYS2AFtUZB5qoTtOVS0qk4oDxY4QIwcX9iFt4I
         pV7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2YMF3SlM0rXsvzXJewcfKGam1OgjAg5d+kC6XMSfugQ=;
        fh=8Yd7oUGrqwOAn9eYfNFuvY87A2TTCoQJX97z+bGBw+4=;
        b=jLgQxsAJcAyeLvpMnZz7Em90tgubsvInfuLKKsajkZSgWX8mYwo+iGKZfEQLgYFQm7
         8113JW/qkT/fMlP6AaELSi6n6dPlBCT/7CnjRjznJJVuI7w8vxmZzdi+E25KI7aATa60
         nDelIIAzUjEAYH+z29rwes0y4P0a5YbSow3IDBcrZbpqhKnPAyqiMCvRPZHFCnfeOAK3
         LNn+fOL5r2QdBozgsDM4Q2L4dU/RETg7S/d0A4u8y6e16nfwucHQ+DfyPSE8HLJruwR3
         iabBllcMGC9K5ScO0DS3sapk0XH/t+SCwcciROGTE2A60v68ZgOEQeS6SYdFt6Yvq4+j
         8YiA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794368946; x=1794973746; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2YMF3SlM0rXsvzXJewcfKGam1OgjAg5d+kC6XMSfugQ=;
        b=TG50vK3iR++UAvxXnX6fExlBLU0x9kop4AaatIBwkLxkWbfPi1shjntFMjBJgEMKrK
         AW6bMFdnZLQgXFygDBcgZbYKu/yRiExBoOoccGQF3+keMhiiZ2o8Xb2AQ5me3VOY61kK
         8OS/BoyU0nF4PeZr9xgaxra2/q3UM4OHmYxd2FDUeYQ70VLkG4XiVvA6xJvvXRhUJRhi
         lLbZB/6yXwq3Meb+Cd97vIvCTivwP5/uKEzWdgJzuuhyzQAc/+hiyglW4PoUsEV2kjv0
         YjyR5QZuTzkxzyJ0C4eFjl6It7itiqGTjtTmA3MNo915L1HmGk4V8l0q7dxRzjcdQT6Y
         5s7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368946; x=1794973746;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2YMF3SlM0rXsvzXJewcfKGam1OgjAg5d+kC6XMSfugQ=;
        b=RwuZZhQ0fR4eGbFVLWilRJmXu+1854FzRd0nGpfWV4XqVuxXYFRIm2EQiBfKIwREzZ
         o/glJKekIlMrpdg4oagwLI4CPRPCJ5uy8g2vaVE/UR7xhyOGP1HNkaVpHGdVBiNxzVbL
         Pw/mWI/ZvI6DH8cS9WfmoXiyrbBjN++BYtt/LGDqfM9DrDzkRQZncwq/tsXYlHgRD9N6
         zEiyq+IjEMFL9UEareiEkCopifpsoh7XB6+3PApZ1Z6rJHQXN1K7vRSB4XobYpyt/48d
         MT6wymwEVVkOLN4ajJTHkUbnESiO+D9sp2o5xUMMtCLy+s+a0kTBhy9nDJ7vFlEzfR8r
         jjNA==
X-Forwarded-Encrypted: i=1; AL+hErF/bvJI7etr7G5wr+U3unCiU2gUFGuvNExwbnQTgXkCrCYqtSvjsghvOqfVgXEe7BQwfMHH6KAIwOmhFvxAKp25@lists.infradead.org
X-Gm-Message-State: APuU4Z88qlo8UVLARzqVqnX3tR/ARUhHDqJaIlz921o3P3uwD6blHCo6
	y24EN8k+Cd56XfZdn4qyaX4J9sZtWVgpCuTAnKxtGldlBTGCp+bz4CmR/3aQj07DVgc6Hcl0M57
	chKxrQXNh5BCKzgHvn6gANlR5WCHWcQU=
X-Gm-Gg: AYBFou067RG6zl6fd4ZbVtYt+sXHQ38QbWRV1v0MhBuUQDUDRGYY4NoN8N3w6UEMRWI
	y0fwnszEU1m6Tsfx39vkNBU0fNSlAT/dEFdbscBHDw1/JeJZYZUi83W7tuIUU+XHN1uV79ZCUXb
	xyaIlj9YSdzpsnD8GVru59XvIWdEJOfMZkbuZHQcoxUJylGOT5MzFG7Qyxn6Y4sRUNdavp9xvyd
	Ueb6J09bPgvm+UIfRoMPoTznuy3dCQbOB8B+GzhzNrEoexI8cE7nc1WmmXcbutsHaT+1CPC60BP
	CUFrf7R6GaRf70PBeDCKbxHssWhKzX1U2cjs5mrl64pu6taY5amhOqB1kc9uw3L3uI05fnPS9OA
	NdFIh4DbajXm4mopBdqC4tvfN+ADf8B0pjZjMBq0E9T+xoL1Hi1zmJu/6qBcrv/LuyHj5rw1UvN
	9LmHyLo4/d2/ZXCE5dVWhDoe3ZfTJBGx15zzqLWQQzTYgQrkFn
X-Received: by 2002:a17:902:f690:b0:2ed:acb:aa95 with SMTP id
 d9443c01a7336-2edd7b397cfmr13754315ad.32.1794368945939; Tue, 10 Nov 2026
 19:49:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261002043856.97295-1-phucduc.bui@gmail.com> <a236085e-5ccb-40f4-ac59-75e0249267bf@sirena.org.uk>
In-Reply-To: <a236085e-5ccb-40f4-ac59-75e0249267bf@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 11 Nov 2026 10:48:54 +0700
X-Gm-Features: AclHuK-_fA7OAuqiopVuFE8fqK_zpoIlrFShcyl-AqkfmWeSwLjfc9AT1zIS0jU
Message-ID: <CAABR9nE8Xo7z0Yg4AKPmqV9+Fjs3bnH+8pYykpFWOcq+3SG92A@mail.gmail.com>
Subject: Re: [PATCH 0/5] ASoC: atmel-i2s: fix clock error handling
To: Mark Brown <broonie@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrei Simion <andrei.simion@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
	Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_194907_277015_4220E0FA 
X-CRM114-Status: UNSURE (   9.53  )
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

Hi Mark,

>
> This doesn't apply against current code, please check and resend.

I believe this series has already been applied to the for-7.4 branch.
I've also taken another look at the driver and plan to submit a few
more patches for it.

Best regards,
Phuc

