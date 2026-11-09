Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB50606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D8NPvsXM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M9pIWTYv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a86PC/JlFhI9QzWc5mWdTvSDfxy09rYrpKx10NN2IkI=; b=D8NPvsXMwdewP5hu62eRNSYBQB
	65gsJECTYDjgcGQxjEUIzm5I2rWQjd5eZB3ixXw5OXwYthT6L7jG/fa15guLk4dG9MdFbJo4+Ry/5
	cdQTSEcvKg+u7Mrpln5QdZusY1igJ9DtmsHYRwkSbxOCg61x+H4kVrkuIOQGkv5vsWqw4WcFq3BGQ
	Nl3/qCJHqt9CbpQYD/7zANnTi54gTKv7ggo5TReVqTYCLTbFF//r5iBbH1UJAlZJv0ovkaBv4/6x9
	yT5vXCi2Y9PEhsZMH0dprKyhkBLT6LAo5N2VSGLMwmeGIGbR9crNpHgv2ELNaBSpUIj+u5JbSz9Cx
	GPU79d4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOiu-00000000j0m-3Pzg;
	Mon, 09 Nov 2026 12:43:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOit-00000000j0O-1flA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:43:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 908A560F48;
	Mon,  9 Nov 2026 12:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8375C1F0089F;
	Mon,  9 Nov 2026 12:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794228222;
	bh=a86PC/JlFhI9QzWc5mWdTvSDfxy09rYrpKx10NN2IkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M9pIWTYvDBscsjoqdj+ff4Jrjv6tMYkVR49IQ9UXzyvbUvrDtRsv/H8kxdjV1d7cg
	 lc9/ovyHmXaqFYFvXyM5pN0KNogDVV+fA6Hg7SY42xTc6YFvu+rLhwH2qn5ke26XAr
	 /LkJhX0VEiNl0EqUzQj7rfm8Xtk5SzCpD1/ZMYNv6PvGcxWsGbEfsOC8quBxap8ZgK
	 TsyWXMstC6PGwzmpwKpKXSWY9fa8XOXPXXKrHkyH9aqdcZ9Vrwas9pIgzuOWdbRzcw
	 dFpLcTkcD1MR+aZTF5Tj9L66S//Azf1T/Sa99E4PqL4JFMMQMaEQO0k+eprsDY2G2d
	 riJ3f4MCuW8AA==
Date: Mon, 9 Nov 2026 13:43:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artem Novak <artem122novak@gmail.com>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: kirkwood: Remove duplicate DS212 compatible
Message-ID: <20261109-burrowing-sloppy-bumblebee-f2d7d8@quoll>
References: <20261107060549.598466-1-artem122novak@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261107060549.598466-1-artem122novak@gmail.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 07, 2026 at 12:05:49AM -0600, Artem Novak wrote:
> The Synology DS212 Device Tree lists "synology,ds212pv10" twice
> in its compatible property. The corresponding Kirkwood binding
> also repeats this entry.
> 
> Remove the duplicate from both the Device Tree and its binding
> so that the documented compatible sequence contains only unique
> identifiers.
> 
> The compatible ordering is otherwise unchanged.
> 
> Signed-off-by: Artem Novak <artem122novak@gmail.com>
> ---
>  .../devicetree/bindings/arm/marvell/marvell,kirkwood.yaml       | 1 -
>  arch/arm/boot/dts/marvell/kirkwood-ds212.dts                    | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

You also should have Fixes tags.

Best regards,
Krzysztof


