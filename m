Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F38606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 09:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e4dBrfd0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TTQIJQdF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YU5P8Wuc2M6bZTL3XK84wjuebJ0zvL/QXfNPgZyOqi0=; b=e4dBrfd00Naw3b
	/ikMnEBld3M0Q6jbkqrRb4zHQIoUZHpLqf4QPo91Z16pYkeIkJJqmEe26V7eJrvTdu4kRnPFo7/Yc
	ouLfWhUPYxJMVUu8QX7EN7Tdcc4p1iy1baj4j/pnLhLpell4+bJ8SRYrIKuVtLFwMW8ot+/EwUlaf
	J33aqGy8Tkqwi9qxQz8VyPslamOdaPhfL60rqdHGUPoQajiGjl5PoopHu1X8P7CCWj0fI6jskkAta
	eY/kn83VGpscdEakUuVjo8LyHqYKxNeBR/4K0mdA25B2rAoODE8YI+Z3yDgSwByWhrM9fF5I9Z4zk
	2aJBnUi/bBzFjV7ADH0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULDl-0000000EVjT-2a62;
	Fri, 20 Nov 2026 09:47:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULDj-0000000EVjE-3tdg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 09:47:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B83F4679B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 09:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4141A1F000C4
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 09:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795168071;
	bh=YU5P8Wuc2M6bZTL3XK84wjuebJ0zvL/QXfNPgZyOqi0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TTQIJQdFmsgcCJvZ5orSt7w0DatjFVZQwcM9IEaWaC+WjWprBbCupEHBw2ZEdEY5b
	 BIBCQ8gTLt9anGc3R+WoUEP/8X0wqmmRyUA0Is+/tDt6D0Coe+GssnIRmwyUztMzR9
	 n9c4oX6NDEhgWoC9wYM7VnNjMV3ikjcOOi9DiBzT4NUIQQANyKjVCwoQ9tX93LQ4Td
	 Wyq5vz3a4GnOFKlXnvezyfJNzLPLOgMgy6KV/q8eVLSgE7z+o4JrHPe3rMwYrkadWP
	 lboTcbWu9QSv9dLAlRzQXsDKcewPjqfaR/lq9p/AjBDOYgb+cEVXKzHr7WrFntR/Gm
	 Qp/UOxFXEysyQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c17ef1e18cso412932e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 01:47:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEzq/pvL9vP69PqVWwZ5addFOyB96bkpCmB1YNHjTvsmXZtf5uPk5TK8em8RfNVraqPAKEK2kMQEoFYsu8lJ2VN@lists.infradead.org
X-Gm-Message-State: APuU4Z//UeXxCQu2kjUelgwhY620KCQyWnc0elMsgntW/OYfLRVy+hrM
	wSpzWHl/11ImBl51BkfJghSJB1K+YrwYm9cg4xCJ1jI2m+vGQjodBjORFj/Z9UTjPD5BW+Je5r3
	HU6oRQdf/coMos3rlSS1qEk3TJzSHCbU=
X-Received: by 2002:a05:6512:6d0:b0:5c0:463:7b4d with SMTP id
 2adb3069b0e04-5c1bc85f15fmr656116e87.46.1795168069914; Fri, 20 Nov 2026
 01:47:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261015142552.4128028-1-ryan.roberts@arm.com> <20261015142552.4128028-2-ryan.roberts@arm.com>
In-Reply-To: <20261015142552.4128028-2-ryan.roberts@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Nov 2026 10:47:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLkrWojU3FeTPGOCFHHsbmTGYG0Tz3b2nrn7mMfsDssCQw@mail.gmail.com>
X-Gm-Features: Aa3M54rOrfZtY95RmYFxRv97HUcFxeSdg2w3O8Cm90EYC1dabPW2gsgZ-nnS-cY
Message-ID: <CAD++jLkrWojU3FeTPGOCFHHsbmTGYG0Tz3b2nrn7mMfsDssCQw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/15] misc/arm-cla: Add driver skeleton and documentation
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean-Philippe Brucker <jpb@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Oct 15, 2026 at 4:26=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:

> +Inter-Accelerator Communication
> +-------------------------------
> +
> +On some platforms, multiple accelerators, each attached to a separate CL=
A within
> +a cluster, are also directly connected to each other via a shared bus to
> +accelerate cooperation between accelerators. The accelerators sharing a =
bus
> +cannot be isolated from each other. When collaborative operations are la=
unched
> +on each of the participating accelerators, they synchronize over the bus=
,
> +stalling until all are ready.

What the patch series needs to do is tell us how this topology is discovere=
d.
I.e. will it be discoverable from the hardware itself, or will this topolog=
y be
described in device tree or ACPI for example?

The kernel must certainly know this topology to be able to synchronize
work across several cores? What happens if an asynchronous acceleration
task is running on some cores and no actual CPU load is on any of them
and the kernel want to put them to idle or shut them down? Same problem
on the cluster level?

Further since this appears to be hardware topology userspace must obtain
this information from the kernel, not the other way around: we cannot
have a situation where userspace "just knows" stuff about the hardware,
keeping the kernel in the dark.

I think this is a wider question about the discovery of these CLA:s:
there must be a coherent story about how userspace finds it and maps
it topology and that information must come from the kernel, so the
kernel and userspace have the same map of the world.

Right now IIUC the driver probes from discovery in the hardware from
CPU-specific registers so does this discovery also include the topology?

Yours,
Linus Walleij

