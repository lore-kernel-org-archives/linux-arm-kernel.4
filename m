Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C90D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 08:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kvaue49h;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=mIehDwg0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Wy8dia1SpW3v1KBZQHRSI//A9PqnMJx202VcrBv4o7Q=; b=kvaue49h4JJNZt
	nNoW7yais9cOZicDHinIhWstsfIIy3KGNPei4ztSulUpHrxo7a5Bs9x13nPd01L0QGyyFVBi3u5Fl
	KjzuRWtV9u3xsPYw/GDjVQRzdF0JDrtVfNRpj86ianzYsAMKzO/xgnfCjb3spO6MT3PzxKgZS4vvT
	9CDWyDi1oYLZZqCj16qiJ0XBXSC+IHCJKC2vFA9uY61EQT7TYIbHeHyQbUOljran1OUZ5zVseyzw2
	bF+rLWsGVaN06OVbEAtEld4eu/eGEX6Epq3oLvswlo5QTCSOkFACfv5SYgwX6hnsTdUIe955wuaSx
	e2OjcoSSaUg/q6POznjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUYl-0000000CM31-0Uwd;
	Thu, 26 Nov 2026 08:10:27 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUYg-0000000CM2a-2iU7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 08:10:25 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-9213eb1f3a7so57407116d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:10:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795680621; cv=none;
        d=google.com; s=arc-20260327;
        b=YMTR9p4GMgxuzeontVulQdV3gdX4/Mic33NVUJVAH1PBwDqhIIndMg7M611aUIpAOU
         5S3ViySimembPQ0D/nwUUB7eLZu68uuAIClrjyo2s7hXVUvF6FqFg+1bU8HARzZs/F7E
         U06hwWwLdxJe53swx7l5dcpIWyLtPzX14SxPz5FFOpwLRi03OzJ3Gl2Dyvu9GvfI6HYv
         5ac4KUimR5ao01qr1iVQcF0lwj/8IEk5Y0AiVyyug1h/MtIut9/h25ASZ0ZqtOtzgtKi
         gJU/RyQjbrVRGm34WJnhBR5ZQT5Vo8/7DqMz+ZBmROcZ5LmMAo49qiBntpPmbfZL59RF
         DoCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wy8dia1SpW3v1KBZQHRSI//A9PqnMJx202VcrBv4o7Q=;
        fh=pAdoIEmTeo79TQSYJW6ykra+iYFBJa8XQvQurs2Js3w=;
        b=nHVMa3lnhD8SU/gajxKAzOifmilHPc2LxnlO3GZ9KD5Gdcy8YXYRdgA2yYTucoc4XX
         2T3ATkmEFYuLQOSgryI01bwKwhoKEkUQa7Yg+dijfvmZ2oinVX3o+N3MrRhfoDPconhG
         7x6L7GooTu93gw00wIWyzyLQO0GllzN81obe3UMjAWsIX1tMIPlRMdyhU0mJrJEUdxGG
         rv9Qs5pkh3+2STnri6VEg9C5Ary3Ae3iKNdBtspvbrFVjKWz8aGoYGrs1/b3Ze3PhDEx
         WMrExTJhEB7RMI1CMZ1CYE1r9zh0h+8aq9fL88sZOqcKY/d5MmhNhpUTIeerLLRkhmPa
         vVwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795680621; x=1796285421; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wy8dia1SpW3v1KBZQHRSI//A9PqnMJx202VcrBv4o7Q=;
        b=mIehDwg0TWqIHvvzVfNCsdjCXZpCpmRQB5jTeVFumE5aOpz7hGOdAflH2FwMxUvutQ
         DdptyEJnm9d6rB8vD1RnZ5Pd9QBeBuknL+owy3T7q7D+qeVM8AdXhDgDk2Xwtd751WaY
         Vl45ZDg1WoQmCefM/wEZXThyuCSD/okgM+8YgUe2ue8HRQGmaDQJ/O+B/k/U5Enaxy8O
         aGXTL5NNUebZPdlUc1iZq8V1lUcKc0lnoEb3L6N6ZJEjHb2tPLEspr0M5/jZhb0S6wP1
         P7U2MbIZIQVi74HsnwB7uCSaGEi/kyGAw6tgsi8kogASAK8EU45+fduep4MGMA0ubXTQ
         YLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795680621; x=1796285421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wy8dia1SpW3v1KBZQHRSI//A9PqnMJx202VcrBv4o7Q=;
        b=qDHoI3BoWrMiT3Ybbebb3kXtOdVNgHLHR+xY3NeWoic9m2Bgz2gI5Jl8blb90I6o3T
         BYRhCtXwapbF6H+07D80MWuID2Pwca4NqQkFETP6DP4fjLA3SgUFyaiMf9HdRT7JAZJd
         jP+FbxX4o5uE53zC/AjlzMTQ3wezAuPFJ48G6gJy6cEbrXQdsbGlI1h9lmz6ZqKvgMlJ
         COT51YKPVQTZCvYxJy53SWy5Hjfc7m3dqK+szSev8xv+WrTeRQ2NotU/xrs6lSheot52
         mi1T27ILhDaJaF733nETqVdCAmCx74Mcg0JoihtAk+liP12Zg1woL2nkCy/aEPli2h5q
         Tfag==
X-Forwarded-Encrypted: i=1; AL+hErHyuf9T3zavuWzX/S8vGIXfvNgxX0F7SvzqJfbtVV0lqzBDIqWu5GlDH2Jo5nQeNuktCB4LcG5j0FCP4EBYzF0V@lists.infradead.org
X-Gm-Message-State: APuU4Z/AkaTfaxplvU5hWOjgC/5y6oR6K9BTm9OhoQ4SqueSM4I1ZXl2
	wVDIkEFl7XJFmGqAArr4AoX1lqmp7JGbWQ/Hq43lXQgWtp+DLc5b6aP8BZ6yIkatsifbWAd339p
	U+0OLecxedC1m3lq+FgfmT59EtU7edGjwXIrUPE2K
X-Gm-Gg: AZFdTZc1RBIqocz54b1t2WR5ksQow5XRMrjwzwijHcCvFCqvEuXOtaKbyqKj5RihC2i
	ZoTfA4XaFYEzvnL5nlqw16HqA8oVavK0FLGKG1k31v7+5em14w++oVkJMwXhetwV/mJKV2n1fot
	lqublBe96/ZIsH4oN2svf4boJ3RcZrS4rq+nydgaAGKPWKgVsw8GAj/CGE/FBPzzM7jWSFfxKpv
	yttISZc1z+2arx20V1y0sinwy3t94bNLklVtf84h9BsrtjdpTclg2/ZWrwq8fRGyJSZB5y4pK70
	6+A8fbI3ryUaE6cIV4sai/3LDfSTu71xxcbdHJTy3eiH7M3E7pz49nFTErw4o1VwBwL9KiU8+98
	2Vef3GIrsuUZ/2uDE+mJNbenjhG8E8KnhZvOQ/w+VYzrBETS1eh5KA3gN3RA50cU+O5Y9fJneWl
	HqWPJGjQKQfa52U9IKE0DEGocW91gEMvMvJ1I=
X-Received: by 2002:a05:6214:8441:b0:921:1e0e:4f97 with SMTP id
 6a1803df08f44-92134b03b01mr303378966d6.30.1795680620848; Thu, 26 Nov 2026
 00:10:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118-de25-nano-v1-0-473d16131f7a@gmail.com>
 <20261118-de25-nano-v1-3-473d16131f7a@gmail.com> <20261126005120.176307-1-jjc@jclark.com>
In-Reply-To: <20261126005120.176307-1-jjc@jclark.com>
From: James Clark <jjc@jclark.com>
Date: Thu, 26 Nov 2026 15:10:11 +0700
X-Gm-Features: Aa3M54qYE5oVeJKlBQz_MKlaOtdOgsDzCf85Y1jzqfbjt2TEAwsajAiaS_0IAJA
Message-ID: <CANz3_EaWr=qjxrVL6ZoqbxfzUxBJ2cH1s-x2UQanpj9AUwtkkw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: socfpga: agilex5: add support for Terasic DE25-Nano
To: alex.cramt@gmail.com
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Mahesh Rao <mahesh.rao@altera.com>, 
	Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_001022_787523_534F6ECE 
X-CRM114-Status: GOOD (  19.23  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 7:51=E2=80=AFAM James Clark <jjc@jclark.com> wrote:
>
> Hi Alexandra,
>
> Thanks for posting this. I have a DE25-Nano here and have been running
> a mainline kernel on it with a board file based on Altera's.
>
> On Wed, Nov 18, 2026 at 08:07:15PM +0100, Alexandra =C3=98stermark wrote:
> > +     leds {
> > +             compatible =3D "gpio-leds";
> > +
> > +             led-0 {
> > +                     label =3D "hps_led0";
> > +                     gpios =3D <&portb 17 GPIO_ACTIVE_LOW>;
>
> My testing found GPIO_ACTIVE_LOW is wrong here. Altera's and Terasic's
> device trees have the same mistake. You can test with
> /sys/class/leds/hps_led0/brightness . With GPIO_ACTIVE_LOW, 0 turns the
> LED on and 1 turns it off. With GPIO_ACTIVE_HIGH, 1 turns it on and 0
> turns it off, as expected.
>
> > +&gpio1 {
> > +     status =3D "okay";
> > +};
>
> I suggest also enabling i2c1, as Altera's file does:
>
>   &i2c1 {
>         status =3D "okay";
>   };

 I also suggest adding a &qspi node with the flash, which allows Linux
  to access the flash as /dev/mtd0. This should be disabled initially,
  so that it works with the Terasic flash image, and then U-Boot can
  enable it when the flash has been handed over to the HPS. I used what
  was in Altera's board file, but with the rsu-handle removed.

James

