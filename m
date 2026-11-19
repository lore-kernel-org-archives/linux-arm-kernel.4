Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5175606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 22:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u4vz/jui;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MhTYs61J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LJJJphSpkcmZiOiduY2/41Fd5r8y4RK3Bv3vN06K7oE=; b=u4vz/juiyU9ipJ
	pi8hTdVpFovYJXEeEpKx3JX4xXkeNUMCAw3cX3WZuEpd/iuxGfzqnojUddKPckQmDbF8FY5+Snl2Z
	ORXqVAqcP8kJ5G0K4jiMj7SpKhso8qg85vtk8OCI5IuNJWoiX+6YTAnNCoYFo4UF/Q7dHQ481GgNZ
	wX2UUgawBlLt0kfKLfySZo3ikLqSvUs7p0KwswDDk7C+DNZ4yq4utF88oRXihKjhBzg+5qS97cQ0/
	k/tuJ8tZn2xlrKqft15FSTQWIemo8eLg2ByqiKzsE1Jn3WVgfFEyJzxACHa9HAiE0JpBAkrthpljI
	L70CMN8J9sFehgUh1Paw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAKC-0000000DXvK-33hy;
	Thu, 19 Nov 2026 22:09:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAKB-0000000DXuw-0Tk4;
	Thu, 19 Nov 2026 22:09:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 860B14338B;
	Thu, 19 Nov 2026 22:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB711F000D4;
	Thu, 19 Nov 2026 22:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795126186;
	bh=LJJJphSpkcmZiOiduY2/41Fd5r8y4RK3Bv3vN06K7oE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MhTYs61J8orzDyAmOl/as7tzaohrcDQ4G/1YszAcNynaZobkt8SIzmq6BznMynTgA
	 jtrWZHHLykfcsb8Q1Oyjxrdte7Z+kl994ynu4hlUX40l2jqVSEVdbfg+hLxxndGqma
	 507nvfMkrtqvNaeDtSemxgtjKcKAl3urAFxDSB/AZAyBn0mACBbAVxn8myLYl2nxEj
	 vhltXhiltGJb2fTCjhuFeYtpyYVnZ9nFAB9aWcG2HOKtVAcfnq8DHiG3gZvOMAFoKI
	 IMCroMXrA5n2vy3L5iolmp9qz/ujoKHVxLPXS3GIM6yLJnRkzDdyUKGqn2onKgoonx
	 ZBgEoIYEwVVeQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20261113-rgp-91-mt6363-key-lock-v2-1-adbd48f0f830@baylibre.com>
References: <20261113-rgp-91-mt6363-key-lock-v2-1-adbd48f0f830@baylibre.com>
Subject: Re: [PATCH v2] regulator: mt6363: Serialize BUCK_TOP key access
Message-Id: <179511291010.116416.9577252743085979937.b4-ty@b4>
Date: Thu, 19 Nov 2026 18:28:30 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JNdnc9gqp+eN6TQ5wBFxBkuYGTrKYyKoiaiGTpGAVQQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+Fy9/aJYiycW6fv6ZrlNlvwLv+uxcahdcKW36bEv9t
 t6tPBtfdpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiMo6MDOvFS7N0dxY/1V14
 ryLxee2rh4u3XKzZ4T49f87cPck3TS4z/DOw2rdzr7bK2VksV82fzH2Y45w4P3XG3atGDKuT3xz
 /ZMAOAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 13 Nov 2026 05:29:02 +0000, Alexandre Mergnat wrote:
> regulator: mt6363: Serialize BUCK_TOP key access

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/1] regulator: mt6363: Serialize BUCK_TOP key access
      https://git.kernel.org/broonie/regulator/c/b544ca82abb4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


