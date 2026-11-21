Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4F3606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 19:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i+2+HhBw;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pm30k6e0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FpKHiV2uYxe7Ki0iO3VWKGByi0ydeGzhGSrgX6lNY+s=; b=i+2+HhBwaBtxWz8xhID/TLn21w
	s4evx+owO4CLyKTm53x9jh3MUhB5RgVvWSqFSwgm9BB+bXN2UEWthB2XBGpUdXk8BMyrlkANyOuEz
	LLpNOoULT/MfvnCRpGFTzbZ42Ug/ewnZxSutP/yTYLOF2uAOHrrVN3BLDNMqQwcYKFHQVgaQFwgPf
	2YIxMi6fEc0UhPwYMF54urjO5S78UoujXWDD3qA4gFVNan7ROifnfvLeuwDfH7EwL5IpTa3uTj5vm
	QjZWvvomi2fKmi6n2ylnVYPJ+6ItsSU8m1PVDirEo+7jTYSg5FSLJfVlpR/cslbLqKSw6Fbjc8nhL
	1huwp2uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqPh-000000004XW-136j;
	Sat, 21 Nov 2026 19:06:17 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqPe-000000004Wl-1gzI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 19:06:16 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so23919495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 11:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795287972; x=1795892772; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FpKHiV2uYxe7Ki0iO3VWKGByi0ydeGzhGSrgX6lNY+s=;
        b=Pm30k6e0mRQku/N1Hah5IGZNZDLrkkQm7QIRg/ZGaga/Ja8qermDte3BsHqPBjMEci
         qZj8ANgAoEJO9lUeLO96FitkdpxiRr0M+JUac3eJBfOH6pZHqxE6i4u7ouqTuPlt83iw
         Co7JIeIkqOO9CtRd00WM510BQTWJn351CLtGbnBFGHhiyW2sktjviu5zJ27Z9jGc3YhT
         9FSRQOL1VPlhY0VCo5HmeGeq3NLtvtZ/F7VNCcAnmx5WBc8KOEKwXoqtm82OZST9GMOV
         y4P6Uq0TDqWpxfBAtMz8QJMCbaDo4auxSTzGDvPKjtAGHv5qhb2/ozV0+B6MX+kIBydN
         YBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795287972; x=1795892772;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpKHiV2uYxe7Ki0iO3VWKGByi0ydeGzhGSrgX6lNY+s=;
        b=JLJFQI7CicQ3A2GME5kT7xlEWQnX9J8X/g+9bsjAq3seiDaJEb65tMtXIVXQurqh8O
         V/9ecTou3+KNxlQUIJzSrbOBSjHD4T6P0VuwlTuU4NyuBB3VEFmfVvt81WOJg4tX50FD
         CPU37JnmdsdVg90VZa3E+Adpwwjnsm0MHl82PE1mTA8NmvlQ/zUEtlveg2RkxZHTvWva
         T9kNFIq8lIwpbovPjw7GO8810ab4aBjfxuy2u1/qmrjN1Lrk58GNR4TRDYWD7Rnds2dy
         WYIkZTt1FCvnb0OTdUP/1WJ/B5QfxdIh/dB4F3PBbCRUb2fJNwtZkqytBhCZUK+ZX1Bm
         1d0g==
X-Forwarded-Encrypted: i=1; AL+hErF65fImCkdj8uj3xsND6i/8emt8jpDGrxIbIzDoDEiAoBUcCJ5wC4rokL6tyHawFnQU594jEljlUdHu73DTk8AM@lists.infradead.org
X-Gm-Message-State: APuU4Z+mKvuZc3pd3J9DzFDMMzPcRj4euiQyMrXp6OycZlEO1YXI1Loq
	r+ngmZwAehhfEZGLLjZc9GoNdQ1BnzIL6x+INqoHhTlOsAWa+h78yvyv
X-Gm-Gg: AZFdTZfvRePUY1nOld5b+B/Zvog4pNHOPFgUkXIDCme1XJThdPZDMBI7nuPwbcIFlFs
	bxf0Aroy9wXFVqpwrOyIhJ3ucZyS5+I7Sv8SOEJ52EZ2lwKRAjCoYWimN05/cs34wKzfKoPhMyf
	HtBnxQcBJ0Gb+UtYyA4JWyAC6SD6YiysdY80AfG9Ai2AngB9lfHSEET3PXQADPt34aDCmRZ0EcZ
	PVogKPT49h+53t00oxLMfoxRpOUJY+Wp3ZTtdUKAl5KgtPP2bGvBfRRRUMaZRt6MrU/Sp+DXiC3
	uSfICPsPggLfZLzadrL/xq6/BuuU5YLx+e1vcTDb6X5u07eJz71YaK3t0fHRmtyh0hJbfjVo3tD
	poUBMt6vS4tW2NiolijWmqzbQ9sgpypO9xtjQHNsfrcn5vOOyzJ2k9IZi5sZDj1kjRj50halK89
	XspYJ3eE/aVozpUdXaUusrhLFMIotcH/Qbb5inZ52reupyQROA5jg39+swslRX9mKu9lAZLM1HA
	aIDki8mMvAn1Dcqv7DvHfffPT3mpgbgAxenQmv7wn3JuqUy7rWO8nb0YEaZN6Zwd4Me3GipO5GG
	rsWGxcZyJ250721C3hBA+35TqzfwGG67ADV9fzQHaa/Z1cvJyPhkfM9WpESO0XJ/wJtWgPIF57q
	GVZz/35okMIohCEWrY86cm+uqm2OEOw==
X-Received: by 2002:a05:600c:46c4:b0:4bb:6a5a:7834 with SMTP id 5b1f17b1804b1-4bb888106damr154232025e9.20.1795287971698;
        Sat, 21 Nov 2026 11:06:11 -0800 (PST)
Received: from [192.168.0.10] (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm148595925e9.4.2026.11.21.11.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:06:11 -0800 (PST)
Message-ID: <6937fed688e4bf1d7cb81b004c179cc4912cf6e2.camel@gmail.com>
Subject: Re: [PATCH 0/6] Add USB support for Exynos7885 and enable USB and
 FG on gta3xllte
From: David Virag <virag.david003@gmail.com>
To: umer.uddin@mentallysanemainliners.org, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam
 <mani@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Szyprowski	
 <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar	 <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Sat, 21 Nov 2026 20:06:10 +0100
In-Reply-To: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
References: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_110614_466546_B83350AA 
X-CRM114-Status: GOOD (  19.15  )
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

On Thu, 2026-11-19 at 19:49 +0000, Umer Uddin via B4 Relay wrote:
> Hi guys, this patch series adds support for USB on Exynos7885. This
> series
> is based on David Virag's work[1] I had rebased it onto krzk's for-
> next
> tree and tested it on gta3xllte. This series also enables S2MU005 FG
> on gta3xllte, which is also tested.

Hi, thanks for reviving my old patches

I actually have sent the patches before [1], got some reviews, but only
ended up with the clock patches submitted and applied, and never
actually got to submitting these patches with fixes based on the
reviews (which have been sitting on my PC for quite a while).

I think I will submit my fixed up patches (the ones you submitted still
have some problems), and then your gta3xxlte patches can sit on top.

[1]
https://lore.kernel.org/linux-samsung-soc/20240804215458.404085-1-virag.dav=
id003@gmail.com/

>=20
> Please note, I did drop enabling USB on jackpotlte, this is because I
> don't have the device myself to test the changes personally and I
> didn't
> want to risk a regression on jackpotlte.

I can confirm it does still work properly on jackpotlte.

Best regards,
David

