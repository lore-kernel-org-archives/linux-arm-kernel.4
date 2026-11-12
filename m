Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7EA606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 02:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g8OD4B/Q;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0jpUNEO8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pqLudJhoiPVgD2EoEahVlHAVCEoKHq8SKN8B7L0dVhY=; b=g8OD4B/QHpVA8Z
	6DIEJMlqOQ8Gy0ZlsdZ1S8dGm9I1J5URj42rxdOUC/QI6bY9/8y7hpahBhvU+5d3SyPTfoS8N4OBd
	c78eE+inaC/UIxaYUCGodPB/vZtXhD6XRiG/eBXMmgQ1mzWOd2Zt+KJGlK7WaAn0ZWhxrMhP2SF93
	7eru0KmDqNtdCxRMA47hquJ7Kgy3elp5cI72awpQH7Fhx8yzfEL40GDhNzE9qu2m01Dfui0XzxxGO
	7Z59Bn+HKP6srvbfKcBthOMCF+xPJK5fwgJts4yolcNic/Ub3yJf+Hdp4OKR4VW0SnMC6nk0mQGUj
	IC3tDQb8O/ersf/5q8kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKho-00000008XeJ-2w4k;
	Thu, 12 Nov 2026 02:38:28 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKhf-00000008Xbr-3PZs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 02:38:22 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-91ebf4cd218so34240216d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 18:38:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794451097; cv=none;
        d=google.com; s=arc-20260327;
        b=LnZokl3OmK9nrWg0yiXmMM7rtsV3Zz7GCCvKqMKA/ASMw9K6bDenNvhGfRw62MfDfe
         DbAzN8gGUrPY32+Eat4nRxqBpNT+AZntGj+TwqkYtX3l7OhTJrxEXsysbPuJWHar4Xdn
         HSEpc4wIDxakLMAi2wxRx2l2MOU83FM3wgbOLIBPE2TGpbIhEK463YC7vNAILMlmtrlQ
         OBDsfVXHz7EcA3fFBvlpnszSPkJvX/LMXNw0DO3JrjCCmeflMEdVGqkOK6yh7oaO5hxW
         BCQCamGIdyZxle9LJYhjMzUEZTcY2UvMv8ZZsKDeVMBp58SbU+3gpeHQDxyoDEfe9u0Y
         tnXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pqLudJhoiPVgD2EoEahVlHAVCEoKHq8SKN8B7L0dVhY=;
        fh=qJ08KheteArpzl4IvKHXkEPiIjLYfE6bK7FL/PqjiYg=;
        b=gWYgFdoS+63lNY0nzzbZPsQyhnk9mmAtgNdkafDuVbVr5vo4IJKJ7xlcXbhO/4J+85
         9GlVKWD2jo2hJjqRvSOmRYCN/1HtQlmdNMKRSqRVzBEtgXe6fMQDvBnB2PN974kIDoiF
         vodMPn2sN5v24AOoAEetV/OtwOSPl/1WQ4AvpCheAOpCF+5geADCTzyBDenC2/FOyy0f
         LSsWEW63KZZckZuBW2BkQdPKhNQVQJJT1aPerLkc/pkDieZlgcDCGZK0dPEUQuq5vpHV
         IflA+44jdg8nLEB8G2qdzK/I0o3rV8LjjpikUjavNISXrJA3+9PYH46AoCdeh2JU2Seo
         9ttQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794451097; x=1795055897; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pqLudJhoiPVgD2EoEahVlHAVCEoKHq8SKN8B7L0dVhY=;
        b=0jpUNEO8tB4JpaUQwvf3C86N9fNtWiqhlsjtOHbzMeSGxELXuSWTMJoqZlrjG5weS9
         7sgn8HKdwpWJmObQ+dX1DoquNBFYrIeOF4PyUlwE3Z7m9jOUjaH4TGwj3H4w3Z/egbDZ
         h/cfCUNYwcTUIRZHpozhyqCBbqZlyOAnG9fJWfrzQpcdix0RTTu5wsZFEczLvQSDUETm
         0A0hqiUBiMV30hg5Y7xAAaTY5XTKz9I3ImlzX28gu6j7MTvHD101vlZfy7fK2mE4WRYw
         i4pGeAu/Z3SACEsDRKmgU7J6ZVQG/XRDyaBsJJ9vpEADaN3AjFe3jW6Br1AlGP9xIS6v
         nFJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794451097; x=1795055897;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pqLudJhoiPVgD2EoEahVlHAVCEoKHq8SKN8B7L0dVhY=;
        b=uhr5nOAl4ekiOVg8cTAQhU9RyJXIkXs9b8E1nuUXKIOKl1c8HZ7fXqwTiytlcUJgi9
         3aDT6ZWET5KaDDJIsc73nx7s4fQPZ2ctW1L6cYQbStb8Cts2v34CpBYJ69zMLAUTmDcA
         ctbbefCHb1r/+HDGrFX6lZ9Z3jxr5FC2C0M2JHxwzsxCW8jHutiLVLfvrtc7AHfn7hcg
         XN4gxykBy6xWcsjam+Th/x8txlUHP2SQbwVABVcqd71SzVJPqjq/QD7Q7Uf2gBpuucTo
         qTQdDkMn9S0KRYmqE1+qINL6UeLQkal4mr/Wl6RUUBjdtrXPe8odqLM5Vq6G9qYcefca
         Q+6g==
X-Forwarded-Encrypted: i=1; AL+hErHRFckP02UBB4/cCkgzmVjUAYs6Ukan/0wPOWweZyLf4+3WIW5rcTaFEBwaZUS/qabRU135NSxz8a+2zidnX4Jb@lists.infradead.org
X-Gm-Message-State: APuU4Z/Wy1lUveFGB/0q4L33Bt38N4K6cA/53SrI8InFk6q/EOu6Beuy
	YTyzoP0/RnNx5ecZBhEaMiiqe69Fl4vPNQSM5fApkZEH9+PnH97+Xm9OM9H+4UcZE1VLEoQjXTo
	USTdAcC18btjwpJxOwWABcZl8FRWE4kiqKaM02AA=
X-Gm-Gg: AYBFou2mJHODYT+yDau+ii6keILl+PjrmP2EvYDagES15BApVFYqAQsn3iciuOeYuaw
	8Sv6b3oYLr1Xl9uVOMVvvcvjSI0fjhlHjiJAaZDN79ofp1pLunHRW7tOIGrjKx+cMwzflpvq2fp
	YDtBGe/CWTPogP/R3rFGQ06K4Dn9/AZ0HLKYFOwLtxlX6JAB0C0XqKl20LZto3v499zXUJYiGSr
	GezmE02hCeY0AgJW6nwyt+29xBmLA3cNya7jV9VQwVQUWg2k0petaG7o9l0bDDveNGvE9MVrIE4
	tmHwiNlA6sKE8lP9ZUhAqdhI0IPFDPHqccedb0/6KT++/GCng5C7l5snsziFe27iTuXYyOeJTn+
	biG9iHTTrRtw4EbbqwL6nmjZoRHhOzSc8Y3Su
X-Received: by 2002:a05:6214:62f:b0:91f:1383:1bea with SMTP id
 6a1803df08f44-91f13832415mr25376006d6.2.1794451097094; Wed, 11 Nov 2026
 18:38:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261109134506.2794160-1-zxyan0222@gmail.com> <179423231463.488859.16977464890948797360@kernel.org>
 <20261111152012.3506cf35@kernel.org> <CAP7veT+buHRMu6f3o5RaKFdv3fABkWKgkO6KFn5js4PEeB8b0w@mail.gmail.com>
 <20261111182822.580e871b@kernel.org>
In-Reply-To: <20261111182822.580e871b@kernel.org>
From: zhu xin <zxyan0222@gmail.com>
Date: Thu, 12 Nov 2026 10:38:04 +0800
X-Gm-Features: AclHuK9rCxYPptofSIgt7EF7v4G1h1kXDVVe9np1u7jTLTpnwVCKysG5CejzHGI
Message-ID: <CAP7veTJpAMfEWQ7=Bm3iEiFC5L+WBj9PEnPQCEua6goKEP4VHA@mail.gmail.com>
Subject: Re: [PATCH net-next v10 0/3] net: stmmac: dwxgmac2: timestamp
 interrupt support + Agilex5 fix
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev-bot+sinfo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	richardcochran@gmail.com, muhammad.nazim.amirul.nazle.asmade@altera.com, 
	rohan.g.thomas@altera.com, rmk+kernel@armlinux.org.uk, 
	o.rempel@pengutronix.de, wojciech.drewek@intel.com, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_183820_029146_AA5416F1 
X-CRM114-Status: GOOD (  25.34  )
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

On Thu, Nov 12, 2026 at 10:28=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Thu, 12 Nov 2026 10:18:41 +0800 zhu xin wrote:
> > On Thu, Nov 12, 2026 at 7:20=E2=80=AFAM Jakub Kicinski <kuba@kernel.org=
> wrote:
> > >
> > > On Mon, 09 Nov 2026 13:51:54 +0000 netdev-bot+sinfo@kernel.org wrote:
> > > >  - What hardware the change was tested on. For driver fixes please
> > > >    mention the device (and if relevant firmware version) used for
> > > >    testing, or say that the change was not tested on real hardware.
> > > >
> > > > Please do not repost the series just to address the above. Instead,
> > > > reply to this email with the missing information, so that reviewers
> > > > can take it into account. If the series needs another revision for
> > > > other reasons, please include the information in the commit message=
s
> > > > then.
> > >
> > > You are at v10 and still getting these automated emails.
> > > What's going on?
> >
> > As for what is going on: I answered the bot's full questionnaire once,
> > in a direct reply at v7 [1], and since v10 the same facts are
> > described in the cover letter.  The bot, maybe, evaluates the
> > individual commit messages, where I never put the information,
> > assuming the reply and the cover letter would count.  They do not,
> > so the emails kept coming.  I will fold the tested-on and
> > found-by-inspection statements into the commit messages with the
> > next revision, which should settle it.
>
> Read what I quoted. It literally tells you to put it in the commit
> message on revision. How many times do you have to receive this?
> Please either pay attention or stop sending patches.

Understood, I misinterpreted the rule. I will put it in v11.
Sorry for the repeated noise.

