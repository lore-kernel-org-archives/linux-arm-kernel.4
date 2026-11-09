Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FEA606A7B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N6VoyDFh;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mXI+B7Mg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MNALSUguKeNo/Ez0qP/sAmD0UeGu3ljjdxeLtNNj/80=; b=N6VoyDFhDXEN3K
	Ostg/F7AYLDAEMMi+YC8QXfgPaRet6alGqbVZsIcFccC6B6S0veauHx1OmmHvRRb8ZiSx0GiVa4ky
	gWmX/GtPDkuDyGVSy1CUXcPlVyuWe6zNiTadLbGteoQ5L6ykIvhzbFiA/HS1OffqQKmBdpQb1C/PD
	wJCKABLCsHWO/TBz8CUU4kPljoKiwrrrCCpwN8/t1u2orCRqzO5LjpZr5gkL9w+tnkpiop/yG6yNp
	nEFj07siGG2etqCPO/NeumJU0vclFny4PKFZfJXD0k0ic4AYQt+eSuYgfCiP2EIX4DKG7NTUf9d41
	CegoIio2mn/tQ0nh+Eqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSOq-00000001DLK-2P69;
	Mon, 09 Nov 2026 16:39:17 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQSOo-00000001DKQ-12Zh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:39:15 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-5383c97c8cfso300571cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 08:39:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794242352; cv=none;
        d=google.com; s=arc-20260327;
        b=Cbow0zi0XESjqTiIWHztTXBg5H4TMpMIxUrwLek9Pr1PRtxGIyJNK3hM/tmkt+Xko0
         gQTtbqxjvEi/RFM15X/yR86rZs0ZHQUFPKJb3++y+M15WRVaVuVDelnMQAw73mn9pXw3
         ibH0WAeUvuqxUhb2WrlL5QEWY8IM2L6GYlMsiaSPmVWKvUiMM373Hv2SQl38FZ3fcXgz
         exDGiQaxpllFF8M5uJ477Rs2xmMIDBpCKTr/RvVCCJboBIeEjxKIyh+6uYkPdZiyRrxN
         YWxXQyfiTsytUhfI6aOT7pfs0KoU5Bx/ald/yrlyyzOtRHTCuui2osUQHt9y9izeunmP
         d/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MNALSUguKeNo/Ez0qP/sAmD0UeGu3ljjdxeLtNNj/80=;
        fh=hmwSPhGrOth4MNoia/1xu0RZTXtSDmqWR/LSqv5ENn0=;
        b=LactMIlWMbs2ao0GHRFIT4/DA+ioIw4muS13IvRhK/kue65yNNPuuboLScrRsjDvaJ
         CVbEtAdb0d42TW8mNHyl3bOLgWejRq/zkTxNRidd2dk6pfKFo4ptms+PyR+YoxBstpZt
         uWYl72gaRBC9xt9DyRpbF99hcNl/8LMMIGe+lADlrzgOQSy3XyZ4E3VO73KKBvVN+ylv
         x0uDgVCnntlMvg+8YagBU9DtJ0Bhu0MtuAbf/JzKisXWa8JbWV54Z+Dx6lr3L4K4S9fO
         TLPNai/hgL1ZBtl1A4lwl8HA0X8xtCHNzHF19D3tT8lY9Nm2+PrIcJvr29qE21rs1OJx
         LpFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794242352; x=1794847152; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MNALSUguKeNo/Ez0qP/sAmD0UeGu3ljjdxeLtNNj/80=;
        b=mXI+B7Mg45oG6AklCE8rbAW9zaK5ndIL96zZLHbmyPOC40oAE1gY6qijVk7dXIdntY
         9SuC7i7VqD8jPXZD4xoU4lBY7nsK32lZbC5TQmcUrItNndabMyK5031W8vqlQpni4/Mz
         7CPqdVH8OPIkwlQEYYNlTQipnolY0lzUoW0eqoHDOE/8ztw7JTNqkx3x2IxSpVZkOyOX
         3aTYXqYNpaxyuhOsmLFWArcuyK/1k6jsujYRrwBOL31w1Y7MzeeAtt5kX+Yf3MsbztJi
         iVhMf294scaqhGXWpy6c9hIQZqTajTHqfxTFvC+eBAnkLDkEcDz9pKJNL6C/MRFAtqKZ
         NRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242352; x=1794847152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MNALSUguKeNo/Ez0qP/sAmD0UeGu3ljjdxeLtNNj/80=;
        b=mloh35PHPmQzhVABz4iv4GV4zZjbVlam/78qjuSlHBQ5wBhceXkVU8XpVuNhto4BSF
         9yc4Jb9vHKC75p7vK/YdXUhTzRIuGwLoW5Ggz6MrAAekAG38e9XDDZiykMeZsSvgExB6
         /ZSrtFhdYNL3zpyhAlBWXPVRaWTeke9l3H2w/ZDyOAwHRER17ZKRbesyrjyJxy+f0MIM
         Hv5r8notLifmMCL80X+I23rsr7AaswalTk2rhvGkByX9C/jwdtwHnPUvm3BH8r05btQY
         4YjU8U36NmViBXVKB5kaEIzjLmhKWHvV+Yd/pNXXnWtQHDfsj6W4QBvr1T32JkIzrJKh
         DxLQ==
X-Forwarded-Encrypted: i=1; AL+hErHznG86zqNbePwIfWOGHvAhO7k7bkyy7hzGY1Fk2NtIaYFb4FuZIi/OVVloHqJUI2/d38YTHUr1uPtq/4FMPpnd@lists.infradead.org
X-Gm-Message-State: APuU4Z+xY87znkRfIam77YHGJz2lVDdmedEfdWqPvW27+fdBZqhIdp0M
	e8OK6xLbEuWR2ka0+xGqtHgDkdLikEa1C4Af7WRWSL9v92rLmfs+ViTeCxWq8k2QxBfo1UqopSy
	K62LeV175wyyuGdZnnqdiWCee5WwVus1WoUEvIwT5b9J7BZ2xGfeYELBy
X-Gm-Gg: AYBFou0sWxQFuCeAyqzC8sb5sKFtXEOvHqU7J9iGEIMOPhuhvDlrEckkN2F+J1xazen
	OdvdEXheNQwiibNKK+PHKTl2SWeB3atvJyFmrPZ/41hYiiJ3u0DegZLS7yuIJm/kV1ctGSUuGXn
	KGb49Zxr52R6TtOKpV0miBAEekOAMeEKu6BEo9zPfvN+HVNKbZXzIC8mwYUZ/uOaD9IuKizRe0F
	nFa/SW7At4V7W5KTOGChH0EPmpXvHIU0q0e4KngD3rY14K0D48Pw6AzkOwWhe4QquDGLzKuWkpu
	dUUjweSewQBXMPinhTED2xulxfPnIQvSpDaN/dFC5AfsLoYteOqv0KJIhOJNRGZtTn2urSoErV9
	ZRjKuIcYNbXaV5wUjUM4kEq0w2iUpj0cG0HwNS2+txs4p9AoN+5Z2o6Q992CcIAroyfU=
X-Received: by 2002:a05:622a:2b4b:b0:532:8423:1e78 with SMTP id
 d75a77b69052e-55519d553afmr66891cf.10.1794242351337; Mon, 09 Nov 2026
 08:39:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109080126.417161-1-irogers@google.com> <20261109080126.417161-2-irogers@google.com>
 <179423587020.3133545.6594248101575070050.robh@kernel.org>
In-Reply-To: <179423587020.3133545.6594248101575070050.robh@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 9 Nov 2026 08:38:59 -0800
X-Gm-Features: AclHuK8feNx1zDrXSRA0wP-1jAG_C3k6aMQ0LXM4MGvjXYCUb91zzoIWLHYo0TA
Message-ID: <CAP-5=fVDVds_q7NjAcapJw4pUx2psF2c9AsaKZC7nJbcOHOJ-A@mail.gmail.com>
Subject: Re: [PATCH v19 1/3] dt-bindings: perf: Add Broadcom Raspberry Pi AXI
 PMU definition
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, Dom Cobley <popcornmix@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Mark Rutland <mark.rutland@arm.com>, 
	Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_083914_293151_012F8591 
X-CRM114-Status: GOOD (  14.54  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 9, 2026 at 6:51=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Mon, 09 Nov 2026 00:01:24 -0800, Ian Rogers wrote:
> > Add device tree bindings for the Broadcom Raspberry Pi AXI PMU block
> > found on BCM2835, BCM2711, and BCM2712 SoCs.
> >
> > The hardware exposes two MMIO register blocks: the primary monitor
> > evaluates the System fabric and the secondary monitor evaluates the
> > VideoCore VPU fabric.
> >
> > Co-developed-by: Dom Cobley <popcornmix@gmail.com>
> > Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  .../bindings/perf/brcm,bcm2835-axiperf.yaml   | 44 +++++++++++++++++++
> >  MAINTAINERS                                   |  7 +++
> >  2 files changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm2835=
-axiperf.yaml
> >
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Thanks Rob, and I appreciate the testing.

Ian

