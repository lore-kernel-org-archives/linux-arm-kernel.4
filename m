Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACFA606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lQ56Oz8Z;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=DdAg+oy4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Lf1Y3VuyPwvovOGVJHv+EhVFPSKZjC4cG/I119XVXRE=; b=lQ56Oz8ZLwWNxG
	4d4vK029G6GJ4aS+Ghqiw3/k3f1s2v7HdcIKHp3EW8vXlL4sAX9yJtnO7Z9kkOaJU8LWUJuSOZyr6
	z5dc10eT4jB8vyrfaNyjDMjTcQCus0QMyPbIft54gYP0CyyiSLCSvzQ0sdGZKj11T3ZNfT131FJyT
	q+7MgRZ2Da4W7dgzWe42h6lPwleLgwlDvCtGhvJGTuSAeU9lJFh44ofhNmhb+S92oKXfNpP6SKWZ8
	9+jMNwR7X0rwrv1eBzkvoRZHNK+QMhPjPXE+cdK80RV12pAEZXsQzPX9W9w2i2mH0LTWcfSNOwNyV
	0Su28NDWj1MAoJoffrPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyRF-00000007vhX-1h5N;
	Tue, 24 Nov 2026 21:52:33 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyRC-00000007ven-09TF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:52:32 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-8b4dd5cb4f6so34633137b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:52:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795557149; cv=none;
        d=google.com; s=arc-20260327;
        b=bkXjT1XPK/ckBMeS4esXCg8L4M77zhRGqlokCMDxx1BQiJUA1V1/jfCSG7uepWIQII
         2dLHlNbE/TAmgUeCVjLSQDUGL1OKlhQ+vvNN1KJuXXmjsdtN8Ara2QeIkB2ttqjbfJkK
         lKFxkKQLINDheIniqz8cjLiN3vKtH8YyOG6U0HGg4vEV10C5z/rdToGHgQmF07/IAkNV
         c3/mcTP9gQket6mrq5xHZv51SvcSGjrm2GrabtLh9uRsFuaCxa4kXdw7unqJHNc9nVtV
         9Qd+aBgARqxON9n/VDss8FloG+iRu21rK52tlb16Rm0zcmoXkbswM6t76y7f9HLmdHEG
         F+cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lf1Y3VuyPwvovOGVJHv+EhVFPSKZjC4cG/I119XVXRE=;
        fh=vmsFC4vhIrfqWOAN9ha9Yz/hCFZdRgD8HkYHmKaGyeg=;
        b=hIdANlTIf4DvDrm/YKGgYfiLnNkcH8L3mVyymeChemYaXzBFPkVT73zffJOpyGj7Ws
         xakbFGkvi9tUyOw1uvxYhRSPMXd7usvur7gh6kzSB4nPJkqgh4JfRPTZRFOdpe+nPAYv
         F+hyAaXfDuVC6kZhaCG9OKQN6mPr09YBAHqOxXFB0mpCmgBvwc2YNYWNWxmKgGp/Z3XS
         qyzxxbIHXCwi+nKkeTAidWej8+pHcR5coJe717IDUXkxwcdeFUaHKaQM2gkoinnX9FwN
         rhtdaLitf0H0DHAxVqep8hHvsrlYJ8hkfDgOuxl4JiblE9nPFc7PFyh6nvussuHi0Ft1
         Alrw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795557148; x=1796161948; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lf1Y3VuyPwvovOGVJHv+EhVFPSKZjC4cG/I119XVXRE=;
        b=DdAg+oy4/TFQRjqvjVCz6n7+9qs8ERhv7hdLjaRdb6Dv4OTN/DuNqzlv71+U+oMq6s
         bmbAMs4FymVpk7UYFxdprtPU0k1j2jR6Ehq545QmZ10QztyclytxWWRyd0WcBfv5taFq
         YIZTPWK+bZl1G4bX63QcFXTNeUdkMxQtPW+h9KOArPzNWwDOjOXTgJ5mq22Ky0Libtsl
         YCo485NHc9e5sdjf2ugtsI17GTor3u40dggle0M9W3113+4qZdTdzuWnPvANZOMujjnB
         NL4aSk929GOGd0p42pEMnOFMP4xqqhRjZxDA20D4IuOkaf45jmH+rMHBYyNSrUkuCgRI
         yUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557148; x=1796161948;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lf1Y3VuyPwvovOGVJHv+EhVFPSKZjC4cG/I119XVXRE=;
        b=AP9x21PRvcFUuW8Rv7VBgdBm1FIUztNZ4lO3xowYhOz0BspFIeIUkij2ryvgs7d68G
         s2joaSBCs5DwPl4vJ8xVakADbwQfUvRMc7cB44syfPpX6XEVVgJ6GztSeZp4b65AdteI
         4rFjdU7W3FUde8eLW9D2Otxr/yTSazKmDhvxg1QYIJjmU0YpECOy5HFU2y6U6sYhKj/G
         sxP5VHFZWU5Nj3AJYbN/SQ8cMiks4mGJ/VCQtC3uM/2PtiSemb+Rvbj4ggzVnjnMkoWa
         pCIYdqN0ZI/pbJ8UgrpJpH3pEIBnrjg+MDr5vrD+SerIphl+UzpSp1ZTDyZKv1RVAjRY
         7f5g==
X-Forwarded-Encrypted: i=1; AL+hErEWfrWWr4LCU/65+Hz6qN/nUiCmp1ThRo9heTVqTLtac0c/0qN6VeFDgX6ioKAbXtXr8Cfwc7kqiV15jw3gTs//@lists.infradead.org
X-Gm-Message-State: APuU4Z9CBzmPYPj8C4Hhc6E7phPsQelcsoMbjf+FBgSRojFgskendKC5
	zHaaf0YEG/lHaI1ILN8QeEQI+rOrfPo23MKSjvGiIOcqPkrBZk0UY0QlwtUM0tqhHc8gnwuAPrv
	SUf6P7T38FAWJGWKW5AN9awhKyzko/aU=
X-Gm-Gg: AZFdTZdwPZ22xB22ry8f5Gd8RjOQ7gs8rgMgf0AFi91gs+KdWkuVCPbGS1tznwWfm7K
	Ax0UGwhjl6Tk4HKLGWMBb/qxzu50S3bPmU6eVHD3ZGQWqbRQnfp2BZ+xYs/Cpwqe+/o62cfUOJa
	DHXCA3KF5060xfEAbS8jfiAbRtPYM9jxyzvvBluRjWNurXgvHgPasrgqeHNWGlkJPDEsR34iCXa
	IoMcmnDTzRjtVmqDC0Xhm1Kgu2AnvQU7Sfvb+t/IAbaKO0s5S+Qd9yjMBWN3hoRKDHCXEmWvqXn
	ovT+C5PA8pH1HLb4J2qHeqPPH8yym04+aOiLXb6/4yM2zTMWWKMRuUajgVphWaSL01ts/qp7OcF
	Lf3UHXEMrlUnViOxgWkN+QCLcKA2Pt5BDb9kUnpGE5FqBTkHUWAj+w1Q2Y6MzsRxWEWOxoA==
X-Received: by 2002:a05:690c:6d87:b0:88f:ccf7:25d9 with SMTP id
 00721157ae682-8b520504b49mr86018497b3.60.1795557148692; Tue, 24 Nov 2026
 13:52:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117-g12a-mux-data-path-v2-1-fc56db5973af@iav.lv>
 <CAFBinCALe-8oB5Mwpyx-B_7dKJ-WZcMCjycHv=xH+JasRBOaPw@mail.gmail.com> <20261124-re-martin-g12a-mux-t7@iav.lv>
In-Reply-To: <20261124-re-martin-g12a-mux-t7@iav.lv>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 22:52:18 +0100
X-Gm-Features: Aa3M54pdaFD27QxQGunyvXHUItWwaVO9EDUyn4_5FJjuusCb-0isvsezb1c1rbA
Message-ID: <CAFBinCB3auaxcJ4wV+Q-KS4hBKfacrPpu_X9BAVBirAuMNbDvw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: mdio: mux-meson-g12a: keep the MAC data path
 when switching MDIO
To: Igor Velkov <iav@iav.lv>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Lucas Tanure <tanure@linux.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_135230_115280_D4952D70 
X-CRM114-Status: GOOD (  24.20  )
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

Hi Igor,

On Tue, Nov 24, 2026 at 10:31=E2=80=AFPM Igor Velkov <iav@iav.lv> wrote:
>
> Hi Martin,
>
> On Tue, Nov 24, 2026 at 9:50 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> > I have just reviewed Lucas patch [0] which adds Ethernet support for th=
e T7 SoC.
> > He kept the internal MDIO mux path disabled by default, so boards
> > using it will have to enable it.
> > Have you tested that approach as well? If not: it would be great if
> > you could investigate the pros/cons of your approach vs. Lucas'
> > approach.
>
> Not on hardware. By the code it works: mdio-mux registers only the
> available child buses, and the g12a driver writes CNTL2 only from
> switch_fn. With int_mdio disabled the internal bus never exists, so
> CNTL2 only ever gets the external setting.
>
> But that avoids the bug rather than fixes it. The MDIO source and the
> data path are separate CNTL2 bits; the driver switched them together.
> Disabling int_mdio only keeps that path from running, and only on
> boards whose DT does it. The G12A/G12B/SM1/S4/C3 dtsi enable int_mdio,
> and ten boards use the internal PHY relying on that. Changing the
> default touches all of them, and existing DTBs keep the bug.
>
> The driver change removes the coupling: the data path follows the PHY
> the MAC attaches, with any DTB. For a new SoC like T7, int_mdio
> disabled in the dtsi is ordinary DT practice, and the two combine. If
> one has to pick, the driver change: it fixes the cause.
All of this sounds reasonable.
What caught my eye is that the code now reads strange: we have a mux
that we're following for half of the register values while another
part is fixed at probe time.

I don't know stmmac, phylib nor mdio-mux-meson-g12a enough to point
out an alternative solution.
So until someone comes up with a better plan you're patch and
description is the best we have.

