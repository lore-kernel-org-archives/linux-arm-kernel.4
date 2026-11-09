Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C625606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 04:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SdEIJAaW;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ga1UBwdp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WPUgjz9yrlSKqR8e85QEERzjQTMyzYLvqAjjoRM1I1A=; b=SdEIJAaWgj9A9G
	X2yres/PNOJMueUEFgcldUicPFfTOSPVoDmBN4BlHoqauhNyaJzFwailKScI9fpLWE+y+1am34Dvp
	eefVLcFsz6cFpA8yOISv6FONIbt1eEAsnREdY500G9ZntPr7Kxlw2myUcsnJ2Qn5/UVMGsOmxNajh
	PBEBcH0Ocpj9V4kPnYuObmMGANMAGRQi7mCE5GGv1NAQq/R7NXk3OwJBOqpGc8KJMoxhfUo/g/QKo
	P9AaI7JIMXB76PLw6I0bAKjP1vkDmY5lHeDzUo3fvtomNzGsThsbImW0TPPWdmcauTlWv0ODJJsYF
	Q3Zlxa7IMZ+bKQuM2j6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHCH-0000000HKYw-0fuv;
	Mon, 09 Nov 2026 04:41:33 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHCE-0000000HKXz-24rq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 04:41:31 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1128603eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 20:41:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794199289; cv=none;
        d=google.com; s=arc-20260327;
        b=dlAeOlqafwnnPGOTMnWuvy7Z8bIyduyiydqsHWUDos/etor90jIrCJG0AjglGFjmr6
         hiT3gm5C724g6rLB07XiCB0v1pNkMpSvP2wyPjU2YJ/Eb9/pX/2ePWWgk8lmdBgC4c39
         5UNlXqXXLxuy/wIBeK3eU2dC3sqPxmKAoS7unbuNV/7+4LoezGaopb3H8eJ9VA6xJwsD
         8VzTQYOrift4d/snM2CF+J7D2xvmNJclWv2/8Wnye181UGcxkFxh7XdZFtf+ompyHJUp
         KqiGLkBdyT+6XhCpRzU/IKJvvp4dIC3jlJ1A5x/8SP/A6SEYbVUDYeZggE1FFLE47C8O
         GKWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WPUgjz9yrlSKqR8e85QEERzjQTMyzYLvqAjjoRM1I1A=;
        fh=sk0j/OtPaVrYtYnniJakRAqNzb/cHjlhCN1rKuujDTY=;
        b=WNl1ZcmaoJ1R5ZbnRD4lTsxpQ6Hzv7ne0caPNenY8yBPSFjgXYkM56PV120sNYYJoI
         teOyJe3shWG1vld7q5DQGx6mFalpp4N5YfabjGaHjFyPCRr7HJasVq5aozYA9mFolfAl
         0swRB5fq4SUhl0rcIVQTTyXJ+WrR2cKaYFfQsLkaBfOUHm7EPSs99K3+tvJaN40+Sdmr
         l0ZrFDO8SJ71tfl1RwgCG+TxSio/ytBmT52SRMMKqKFnhod9nXP3zekubSk4hX+s91xQ
         tHmcyZUV6/CeWd7QNq//Te5u7pPbvPvokyUuaW5O7Q7XaQHq+k9JtFzkcMzG1SyWTaI4
         ZBXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794199289; x=1794804089; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WPUgjz9yrlSKqR8e85QEERzjQTMyzYLvqAjjoRM1I1A=;
        b=ga1UBwdpJH/zB/uNi6rjDTS/A05iEgI2mfQXmnLjioCuZZs618rmYaKtReXV+R55r8
         VONEPWxkp3sPPA9563RgK2uaaeR6GzriuRyMMqjCP9eRnpqhAY6kbOs5mtyiEvo4NvW+
         bcPXq0pslSc2NpyxEuF53VaEUBGE+CnZqBrAQXIIQpggl0XIUf877wLII3uND6xFJnXp
         gOGq2voPvnNfoY2CHw22Otgygg4voOVP8rT+tnl0J42pOyrDXS+ZSwN1EFpWiXkAa5Ex
         UdAHrU/NctMf0ow/3sHisAJkn+KrBXVXD0ZOeZVsR0NRi4D9XeI5Qz5uVKzJh/3uCzYR
         VUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794199289; x=1794804089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPUgjz9yrlSKqR8e85QEERzjQTMyzYLvqAjjoRM1I1A=;
        b=h4qFkCiqelz6siYDjZRK0g6FZWOOdHaqr8+Sr8rwkcJmkJTLVtI9snEsIqky/K5GuU
         c8akT+58yg2oDAGxNl4h7V+Kqr1ZP0xPHg9qMINRdh2zEXM95NWoR9IC6JQfGyMRYGvW
         XWR9LpNOX8ChGt+P14x38OFNh0dhZj1fhWoijdchgL2ZXDhcyN8Xk7MI0Lm79/A8Mr9V
         gKGWOCif80ObFYBlGrhv8ONIR6LWVtCBVNhZsfdkGP6DiVxuTaut4PMfLZc69V2y0vgm
         4wPeXQc4zo9pSRLC7aW0c3XKxrEpEarJZN1VBytR2ccTodZNT9+DrB/YAxiABlDpc7vZ
         kOkA==
X-Forwarded-Encrypted: i=1; AL+hErHJZEx1vBiofW7M+qcF1aKk/rpITKboO3O6zy+PYZwOqaXz915hDndpRfluIBM8sCRCCkskxl1FnGpDtmyKkVnl@lists.infradead.org
X-Gm-Message-State: APuU4Z/TmGF9+wPUOk5zZ6/gdjvr2oRv0l/hUvDb5YJTQIsjIhe6K4yU
	1l2AOuXWwRk1NeCc8l2GnUaBNqzdZFNcuHbDBUNOzJrhaaxbiW2LlxvQqsHloJMrL+1N95p7/L+
	Q66BG1POOeuN5gqfqtcH0itbznFDLfwc=
X-Gm-Gg: AYBFou394Xb65UJAoL3kYVQGuO2G8obOAfEJ8nGNthpJQXjmP97xhsacSOQcifNbDUP
	w+Wtoq2bpSlTqOkvVe2D7vkk1eJ36GI6VkGAyatDNiPZaVCkuZ21Xjto65h7aAJVfayEU/N21Rn
	PAQtEwQZmjH8cndfg4K4xd01+wU6sUv/O5h+cbHcAwVyXAv3NzM62oswAD+DTHeSJFk5IuTQbSD
	SIqfFtdNRmT5+SHRSn6O1528oi42XxO04sYk5/ZTLOtpVeI3Hj7M3zu8pqyKcKBKhbgTP9yp7oS
	BYqPn+TaiTehai4RPIWkhyujEJSo5iyhXKLVGOKXQ8q97G6uOX/ITV1UR7KjQeKeVBquY4C8n0r
	5ON5Jm+1Dhd0T4dCsmvkh88vh11h0wx8JRGwzw3oIxyGV3jGflyS660p0of24Oja5aS8R
X-Received: by 2002:a05:7301:1285:b0:343:9eb1:9940 with SMTP id
 5a478bee46e88-3725e33de65mr8199608eec.26.1794199288994; Sun, 08 Nov 2026
 20:41:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106160057.2754689-1-hj351016@gmail.com> <avEdYFDUHIj6mq0Z@venus>
In-Reply-To: <avEdYFDUHIj6mq0Z@venus>
From: khj <hj351016@gmail.com>
Date: Mon, 9 Nov 2026 13:41:17 +0900
X-Gm-Features: AclHuK_VP_O81IVVw6nsjch_EUlJXziP3JNmGnD4QyN0YGW8m1KTdax5oeelWrE
Message-ID: <CAGr5VtNJwmMej+90yoLa6su5fcBc1gwOPviMGtjj7pis+Y7jjQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] power: supply: fix work-vs-devres teardown use-after-free
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-pm@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_204130_544307_7736A63B 
X-CRM114-Status: GOOD (  20.71  )
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

Hi Sebastian,

Sorry about that.... and thanks for taking the time to look.

You're right that the commit messages were far too long. I had added the
"how found / tested" note out of habit -- another subsystem I send to asks
for exactly that information, so I carried it over here without
thinking -- but that is no excuse for the length.
My mistake...
I'll resend as v2: commit messages cut down to the bug and the fix, the
inline comments dropped, no functional change.

Thanks,
Hyunjung

2026=EB=85=84 11=EC=9B=94 9=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 10:11, =
Sebastian Reichel
<sebastian.reichel@collabora.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi,
>
> On Sat, Nov 07, 2026 at 01:00:54AM +0900, hyunjungg wrote:
> > From: Hyunjung Ko <hj351016@gmail.com>
> >
> > Three power-supply drivers register a poll/detect/charger-detect work f=
or
> > device-managed cancellation (devm_[delayed_]work_autocancel()) in their=
 probe
> > *before* they register the power_supply via devm_power_supply_register(=
). devres
> > unwinds in reverse order, so on unbind the power_supply device is relea=
sed first
> > and the work is cancelled last. The work handlers call power_supply_cha=
nged()
> > and dereference the power_supply, so a work instance still pending/runn=
ing in
> > that window touches the already-freed power_supply device -> use-after-=
free.
> >
> > Each patch moves the devm work-cancel registration to *after*
> > devm_power_supply_register() (and before the IRQ/poll that arms the wor=
k), so
> > teardown drains the work before the power_supply is freed. No functiona=
l change
> > otherwise. The relocated devm_[delayed_]work_autocancel() still runs it=
s INIT
> > before the work's first queue site, so no queue-before-INIT window is a=
dded.
> >
> > This is the same class as the recently-applied cimax2/extcon work-vs-de=
vres
> > fixes. Found by static analysis / code review; none is reproduced on ha=
rdware
> > (each needs its charger/PMIC/gauge chip and is not QEMU-reproducible) -=
- treat
> > accordingly.
>
> Please don not send direct AI output. You need to drop useless
> comments and trim down / rewrite commit messages to a sensible
> length. Instead of huge amount of spam.
>
> Greetings,
>
> -- Sebastian

