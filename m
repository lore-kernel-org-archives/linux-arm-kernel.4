Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F98E60A2606
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 17:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rxNljxF5;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvWEBKpC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=t7VqJxD8mYb5fVhIvZtGeBcvOXArpyTEScr8Bn60wj8=; b=rxNljxF5hb76t8
	DStcUccQOqoJhj3L+o75vZINEy1jJowPJhKuZypELzIc8enYxSJ/hzvATbXoZE3EFiRmN5hPyw9Tp
	EAQ5jX7LY+pbykMab55neO9YnQ6XJm0G5RE5XFp0jx9SICcCyEyBh6gaeNrAh4bt4fc2DmiqrH6Mq
	oriolha+QRXRnQyxzf28L+5Y5FoYfCxJ9daRcjciDEfRqokeEPt9PVZqzKkFUOLKOCyva8Lo69cjj
	iko/ffxOFKXzbEyOK456XLUxpWl57uJsHS8vUMM9jRlf8ng6PAtrqVlEY73a1PO/wFi/0r5t7mGdl
	/RvfjEdcDek5uqOETf+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSUq-0000000Fioz-0dg5;
	Fri, 20 Nov 2026 17:34:00 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSUg-0000000Filf-0RrS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 17:33:52 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-5eac01ff101so414625e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 09:33:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795196028; cv=none;
        d=google.com; s=arc-20260327;
        b=Vmnu33uZBg3UWDO7+VJMMOam14vsln/Ff25SYc6i736X0iqM8h6Coq1R0jkjvBjrhR
         P+kJzOhKPnXiU/LOa5WdJwmq/tmJA8tujqwr/D1zZrBOEtoz8RNav+/E0J2I3eI4TGQS
         ZO6Myz8xFEzpY/v4mTnAJ44qLW0rsX2zE5Ef1hauqpunw0kYBHVoR5e5I0Z/ds+/x2fY
         gpfdPeyd7APepMCDb1c//EEHPAfoNBzNkh3Zp6DaiZ5j61PObiGXl7Dd8bKxtOSll8rC
         t0/jGzBXz/6OE8B9g20GnGuSi0jEkyeYf6aUer8q4NkHIWnCdrkwwMh+TcOXfd1vrDSU
         W3Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t7VqJxD8mYb5fVhIvZtGeBcvOXArpyTEScr8Bn60wj8=;
        fh=bTNJ78HNERrbrK/LYaRUnsIM0WgGO6EN+XcIVbUggSw=;
        b=Jy4xcPp6drjzCm+59k5foQD0eciDGnMnFYLhw8FLTlXYwdSFDdvPBH4S9SOzkACgpk
         wygk3dEAvgWKX7MjR2W5W5J0XWcR3Z4ZJixknmjitf1i4ROerJAhskZcXZcqquvGqWZo
         9WGZ47bhfFpeth+7C73M/i9a83zHziTheBrrLcmJ1Ll//quVHfGcBrL/nWWezGDrtX67
         AzH6YmWHRSgWQt8OeKdOZFt0ogS+KsrUCR+oiPsa/2yvs/ig3ZQWiBkgRuT+3lIxOVGo
         EsMCrsvjpdTBYDC+NzPhc1FqFFPC+8CDBQqvfGU7vjuJmOjWZ10Uvkd5PcRWRJIbpJut
         X12w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196028; x=1795800828; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7VqJxD8mYb5fVhIvZtGeBcvOXArpyTEScr8Bn60wj8=;
        b=fvWEBKpC/B0AvuB8jxoiYG8S+VJO+kE5wbTnTiBeOzagTE0hrIVjnaewgf6h2ebVgQ
         2AK/l5fb1kcSJtY+WtS9+LidapRMGrgwJ6DGHrUoq/viLIM5xCse0XrSKsg4PEDX9lX0
         0qjYigWyskHf3c67k93XJ23kpsG9/gaC6rm0DvhkC1zF0Cq/SHmIYidCFAzrvVVXRAij
         DH4Flgz9neFJhLsU/Ydaj/Jeos7ODx8M7txrvtFA44LNbKJnT4dMF6HHJbWws+rajZt7
         I4s6A1llYeSOYjDa1n65Wg37Y2773GGv8fj+QBs1+uduEpzilSHa5Xb1AVWFjhtyW9kf
         KviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196028; x=1795800828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7VqJxD8mYb5fVhIvZtGeBcvOXArpyTEScr8Bn60wj8=;
        b=174yEvupcOspMOCQ1pPfkwUJnvOiCEm7GBSGgSMXEDSCPVfT/EVOTwUreGlHjdfYJE
         gWseVIbivmve0tuHkcfC8xm7+9hoveV+CNr/PTH+SMHSbruREVEeUS4TKHxfowJ1Q1g5
         8QNtV4NzW4WlO/yyDwNJHDgtiUX0PeHTi3P2dXWIHHjoFFKFPjq/FUXfxuQADzUq4oSU
         s4LD89nqt+9lY1JU8wKEBTcgIoXtPsnjgkSF5gys7Vx7bg9ZU8TC67HA9UGCEgO38KYw
         4M3WMB2/p1vpruJOQRPfCdQo1ErkTiYw25jOEj9qXuxQmeC+bgDzPVTvyB1MWx3KUWqL
         pDjg==
X-Forwarded-Encrypted: i=1; AL+hErGCX4QYlLFhzWmmsz87dkGYBSrqgllkW9aQbrG1Nk3BNQxDLAhVltyuV6BFjvAzK4ClX9BrwvEzomKqs8lH6nPX@lists.infradead.org
X-Gm-Message-State: APuU4Z8YD4moFfwjJ9RQOX4A8kJh20ONL+DFFKNesliSE/OLV7jWrfB1
	zEt8+PlJL/YsBky9ZT6RBufNJMqJdL30YaFUcXhe3XH6Ar5TdDnWoBfEfYOJyVExsyJJ1KDLnuY
	L07v5hNzRQUTi35wWVNFXE72ojQLEJgk=
X-Gm-Gg: AZFdTZeRYl7j6PwS4L+2dZMTsAsjjnHKBUyXl8zV/tJcCEWAO0ZuK1QYXBzJGpOlQP8
	0GxsMK05C0JuqqNROvEaVqIIBlRtM1m5aEsnauD02sQFt8ZuP5CZcGkXg5vg7cJAbtjHZ3V41IG
	AcIZ9+MS9CerbAOMuH4lejEgXFRyE6JTq7+XIOT6ui1+QtCsfYcY7cYtF/HBTSG1d6wm0D8DCZS
	Xc+2af8VS3YadUZL7cJg88Rg+HEAO9qEXdPWlCqVB0fnoaelYZ3hq50m+wb0BsufxvEOlD5rH70
	Su5NL9ejJS91EBajBu6G7oatd3BNDHcBeu46VotPP4HMOKF9ORy1bfZk4p9R3sIsh+wsxr5XxWv
	uWZrUFbs18BrLg73yJSv8VJY3oWMJ7Hvhr1dWVjsJ1pxOrGpFMBRyQ0iifLfPKLFO7Ys1ik6RPt
	CvwFYJsS4AzyCPgSaZTXkxamSnIS3UZ9g7FG5T+SGzy2R60emwpcJPmWgBZ5di7PTBSSKaq1so0
	+2nkDl/ptRed4yxfCN5+0aROGuUKw==
X-Received: by 2002:a05:6122:1d06:b0:5ea:9218:eac1 with SMTP id
 71dfb90a1353d-5ee8af5443bmr1845996e0c.20.1795196028572; Fri, 20 Nov 2026
 09:33:48 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
 <20261119144848.4ddd88cb@kernel.org> <CADvTj4oJ6HDR2k6qVgefUX-h0TGh2n+AO5gx_dcJFzzWML+2UQ@mail.gmail.com>
 <20261119161151.5251fc86@kernel.org>
In-Reply-To: <20261119161151.5251fc86@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 10:33:37 -0700
X-Gm-Features: Aa3M54rQjy3WuSYK7qM4qXKPc456YWlaTnH7_OIMqG9iK55grQSbT34CyqfskX4
Message-ID: <CADvTj4o_hBYRzpQVvAcyP6MfYjpjy84iGxwoeDN59eVTbKszAA@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_093351_067263_0306D834 
X-CRM114-Status: GOOD (  23.25  )
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

On Thu, Nov 19, 2026 at 5:11=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 19 Nov 2026 16:32:58 -0700 James Hilliard wrote:
> > Would it make sense to address the `rx on` drops in a separate
> > follow-up along the lines of Oleksij's dwmac4 fix [0]? On sun8i that
> > would mean enabling error forwarding to DMA and passing packets whose
> > only error is an IP or transport checksum up as CHECKSUM_NONE, while
> > still discarding frames with a bad FCS or other fatal RX errors.
> >
> > If we leave the checker enabled in both modes, `rx off` would only
> > control whether the driver reports a checksum as verified. In that
> > form the follow-up would replace the conditional bit-27 write rather
> > than depend on this patch.
>
> I'm not very clear on the changes needed to get to "bad L4 csum packets
> still reach the stack" / correct behavior. Would you be willing to
> sketch the full series out already, and then we decide what gets
> applied where?

I posted the two-patch series [0]. The first patch fixes RX checksum
handling in both ethtool modes. The second adds rx-all support.

> What I would like to avoid is us applying this fix to net (which
> seems legitimate on the surface), but then following up with another
> fix which unconditionally clears EMAC_RX_DO_CRC since AFAIU we
> need to clear it for the correct behavior.

We don't need to clear EMAC_RX_DO_CRC. On H616 I verified that setting
RX_ERR_FRM lets packets with a bad UDP checksum reach DMA while
EMAC_RX_DO_CRC is still set. The descriptor flags the checksum error,
so the driver can pass the packet up as CHECKSUM_NONE while still
dropping frames with a bad FCS by default.

The new series keeps EMAC_RX_DO_CRC set in both modes. It replaces
the conditional write in this patch, so there's no need to apply this
patch to net first.

[0] https://lore.kernel.org/r/20261120-submit-sun8i-rx-features-v1-v1-0-505=
8fecba6b3@gmail.com/

