Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4826606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N/3+w2yA;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lvyVWKpP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=87mz9PA+CW/7E4uRqcEgoSgLyusH584rSyT2Z/HLo8k=; b=N/3+w2yAbHW7033YpuRTNSHADs
	PIRHoJt4LAWJ4TUWlI3F49YPxUz0vKkimjviZR51W/jDD1m4Ba6HOMbLkE0Iz6PK743geXh1bQ1+l
	AO/voLgVxWoGaLwj7QrkJy/wJqVo7H7ocYqlD7Mev5l2G65KFU/F2hlU73T/nC+kyHU/LhdYjIEh/
	0RggQ20sWI7WaOTVfGBYpX6vgh8hSPgHF/xguyWijmHpNng0GX9wmUB2Mmiy71tRg24KEkM6+2WLc
	GhhUdGt9YJrbbH9R6mUeqvRIIAySTiaf8Fh7DH3YjwOAoowxIPtuek3UrwTHFnHDNJPMN7GyjxJzt
	kwsI/myw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQ98-00000002fZq-2HG7;
	Mon, 23 Nov 2026 09:15:34 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQ8q-00000002fYn-0CmF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:15:32 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4b467581b98so27682055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 01:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425314; x=1796030114; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=87mz9PA+CW/7E4uRqcEgoSgLyusH584rSyT2Z/HLo8k=;
        b=lvyVWKpPx+oYjBiR9zLUNngUPJmcyO8oRJeuMAFQ7eIqLoCVJgf/Gp3QcaycLoIIIr
         0wrdbJIWs4tshSvvewwc369j8sOR+N0dbgL9qHBj/6cpSOCmBJLTxdfH5trV9I6PGW5n
         iEHGo7aJgz7SvY7MPMHjWyFm+xSD24ctAA6ttZ+FHasX5KVS09TXecsMVVwxm6jYXpvR
         kqTL6Lc75bQMgy3NKgEDNRGXwbkvEjnh7FnDZeVPol9jURKZyLyPMLHub+yGv/0ECJit
         naoo2qzY3HrV14CXeluTw7dXk4Ffhr+08vbh9cMF/J/Dd7UIixHrd6UERaTP30KG0bup
         yRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425314; x=1796030114;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87mz9PA+CW/7E4uRqcEgoSgLyusH584rSyT2Z/HLo8k=;
        b=wlL1u9GF2gLfoT9vBd52vQq3EjlRuxX7BAd6fhqO8lhsF6wCBOWn7K19Ks4xx4pzNT
         pjUufeaQwP8vnTsP2TTazvelUB+5pIP4mVb93lPl4pPUFRn8ZwdrTHgPNGRuO/SKyGmx
         CvBKFzmo7qL/USQfbOCPZuwkeGRuwtHUEO81SFH7sAr0dp3FP69tMV6zEO5mlJbLRNux
         qrRgn4ZTlTSnUOr6ceYl97+VdThaOziLbAFuFcE82piJ/u52YI6jMpaTePfbbW9iaGDL
         GJy/Zp689Fy2rKZwWe7o1IQZCRkLgCwwsrCABokXEkCuVjUfCsV1wNrf8L3PsfM7AaRD
         p3Rw==
X-Forwarded-Encrypted: i=1; AL+hErFXGf9Gg0jSF2rh4/aFfPPXt5xzva243YFxpm/2W/QdQv9xlz/lcVwuiBCS3yBLyTip2Q9csUVTA18TXvkb0QXW@lists.infradead.org
X-Gm-Message-State: APuU4Z/yLhVDcpJDrKlddzdNZPhIBh6cDzLUFGENd2+t1owkWuhTA4W0
	mAbX+zP0upW8pn2QCLR2/oYOeBoDHEAbvhpRwcAq9upI7W090Csxlwt39u7BydE51Cg=
X-Gm-Gg: AZFdTZenEgqBstfoNhyjPsKOy2Z7bsqWzQxwPcwDFO5LzOQLrS9Aq9R/lNg3OBxs6Wa
	SSE5ky1WuhSyucahbKR1VgbBJGvyizHIhlJXKy+ZTJtw8ejwKqcC6u2uZapvSBynMiN85dotIX9
	OrQRvybN7r9CUkU2AGul2ehGBArAeB3qBLMXY9hku8oSkAdeGUXM5I/ibhFHCTffwzs+fb0OoZQ
	7KqCTt+nDcf/FgxZxnxm5vuLLCtEqqmZpkMDQ4YgxhZQHGNLDNTKmfK7CsMpiuEkWw5T+FxqkT+
	QI2mDLrala7LKkSocbd7JnJKMSJ+D5UsocrdbqulO4ek1iY9Eip/5xXIit2/Ly3J/+juRYUxoWG
	gW9gfNgtY2chVJBqNdnVglUpjgkbcGO8PJyAKgMhw5zhzvbY3nH2FKxF1DDoHPsI+Y5iUjf8kan
	KVRCvhUpKYuxOMcl0eAyi6HMm7EiRJdl1IVC8SkqysQgd+96dFtV04R7SoMbu7K34Kt15VtXobr
	xXob/6frd4d3W49A6QHt8fgRB7RyMUi5F8JRRbUlzOyc/9XFaIqKhytCJmv7eyYNU8AwKEga7QU
	Q2KATmH/TwegyiZ55kFjTdJfDHcKaP2bPmDNHLvltb7+WDEA8QxvM5/ROy8+x7L/ArXW7ofPfx5
	HjtQCZF389VdSxnVg
X-Received: by 2002:a05:600c:190d:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb888267aemr218391455e9.10.1795425314064;
        Mon, 23 Nov 2026 01:15:14 -0800 (PST)
Received: from localhost (p200300f65f19a90438645cebc2ee104e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3864:5ceb:c2ee:104e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb8538b09bsm626178365e9.4.2026.11.23.01.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:15:13 -0800 (PST)
Date: Mon, 23 Nov 2026 10:15:12 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	ryan_chen@aspeedtech.com, billy_tsai@aspeedtech.com, neal_liu@aspeedtech.com, 
	tan.siewert@9elements.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] nvmem: aspeed: Add read-only AST2600 OTP support
Message-ID: <awQDxB-09pHSgfJ_@monoceros>
References: <20261121034053.39878-1-prasanth.padarthi10@gmail.com>
 <20261121034053.39878-3-prasanth.padarthi10@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v6s5d2pxosvbykll"
Content-Disposition: inline
In-Reply-To: <20261121034053.39878-3-prasanth.padarthi10@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_011522_459546_5E749822 
X-CRM114-Status: UNSURE (   9.85  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--v6s5d2pxosvbykll
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 2/2] nvmem: aspeed: Add read-only AST2600 OTP support
MIME-Version: 1.0

Hello,

On Sat, Nov 21, 2026 at 09:10:53AM +0530, Prasanth Kumar Padarthi wrote:
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/unaligned.h>

<linux/platform_device.h> already provides of_device_id without all the
dependencies that are implied by using <linux/mod_devicetable.h>. So
please drop the latter.

Best regards
Uwe

--v6s5d2pxosvbykll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsEBB0ACgkQj4D7WH0S
/k7Hxwf9H/8q38Ueri9XT0N4hYnYWo22+INjgZLMlUEbSlxNQBDn1IF2w7mkk8Xv
BdxmX9P9vtKw5T3eYt0Ay8rnTIvrpCTlqxLAdjeAG35Y9i0teVdHBZ2NoruLywJe
o+SMd+vKFQGJIaPZpqZ+8l9UVMX7cw2f63hV8DDB/qOQGLOxUp+8+SMlTSh/0vpb
tdDetsWfXf3zXpUhcdm94FD344QDgGcl4xldzIYrZH3YFr+1yZhRgrSzHEWlg+GK
LazzxZYuxXq1ViTVixTB1tYWNiQjv/4vl/Vwe8zcAcpBwo1usnJXrObYY1gG+00g
g80CYxg/efXxv1fI8Yd2zVP5nAVxKQ==
=C1hc
-----END PGP SIGNATURE-----

--v6s5d2pxosvbykll--

