Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CF0606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lLwGPyad;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h7fWdCx1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4ftw/tqrcxx9i8NF1YbxSWaStdrbSjcLJBYRu56rtjU=; b=lLwGPyad5F8Jyr0T0RuZjCIuX9
	NaFK6QBUWdpsHhwQlNqXzZ9uLSJe3ZL8zMR0v4JQWpxXA3gvVFMDcx0LXworREqnkazfFyS9JNCff
	LqXbRFGCh8Gs+0/Q4OTkCCb2Xc3UKH09YK7E2yWcWNDzf6+qUlBMGBFKur52sK4LBOX/ctI+0b+pi
	20jLT5Y8gdndTvntNEkBonlhg4Se1a56OdZqEFw3jzMO9NTfpOns0Kf3c/UaRHd3SGsdkqwoEVI65
	rZmDfAUNB0qxcAG455yAwT8PupHmpdq7xtJTzVnCpshLX/3B1EYEi2X3bzoX/VmLOTlFW0l9xp8Co
	qPXXdDRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg6I-00000002oSF-2gf9;
	Tue, 10 Nov 2026 07:17:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg6G-00000002oQx-2qdN;
	Tue, 10 Nov 2026 07:17:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D051B63284;
	Tue, 10 Nov 2026 07:16:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295019;
	b=wupRT88DsqM74MQ8sNnoIZ6T3rxVo824Lk2PO51Q8fden/Hf8mAc0HVI4/JsT8goG73w
	 kLnRupvLqvnY4cGr394Ed6JIGokRQsBwsaYRUDieOnpDtGqkH7MKe925HvXGXiQp3MneR
	 ntJagMJLVnqyTHgTpE9aTnPwqhWUHWhBEKKB2SQojaC6cOZT6YNAvxYNiz9sZDSzF0Rfm
	 ktqewbKC2+sshZ4K3iTuieWehPZznR/9Xg974uvS3Yo+mV0ouofr/XuhotywEfCTp2NLo
	 8XYid/yZrQe2Hd7BI+udWMtj3k2XR6QXEK6Jq/VY/KE5vVMaZ/GvoRkSeL14qqxHqdg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295019;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=4ftw/tqrcxx9i8NF1YbxSWaStdrbSjcLJBYRu56rtjU=;
	b=crYNEzHcUDFFp2GnJVra2CSNwz5Hh5GMgHpNbXfpj0ikyrLJUA9XnQsbi9TGfbnW1rJK
	 +uaU1gtKJBEAWSW9WdwRfyfLMnLkNmbyZ5LU0E2M/HZuSq+crZWsRnxwezB5TpjNibCYX
	 hcIE2GTaet1/vuVuvAx7Z3h2AouZl9fFPEHy/MFts7rOo7LX6fNCFMKCafwwJnEddKGGA
	 fngYzduZhgh/GRubH7Z4NHmHmPeG6UFtMGtsJXgPu5HSzl4Jw5AUNPcp6betbPRoruIT+
	 vrSx7uPHP1OyNCICbREML4QrcBXVwB3x7yqOfItYpn3XGedfG4SrV5BJ8idGwTDYNLQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BED501F008A1;
	Tue, 10 Nov 2026 07:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295019;
	bh=4ftw/tqrcxx9i8NF1YbxSWaStdrbSjcLJBYRu56rtjU=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=h7fWdCx1EeHpALn34KiekM8ArG5NzmVVxvIDz4XvyqlXbHo5TnNOKldOwveBpU2kS
	 nPetamxERlGxs1fFCENMnebjb526sg7+5EVgvKm7t4A12beCAEVC2ANbNvgrrFDjAm
	 W5/nr1dw+hb16Qn1Lw+Z4vABD2Qgpwmiwk4gNxKzCP3/cPdJq0BQbR3xlRdZoReXd3
	 blM4YnmW2t483+oDrglaunF5mBOg8gwyJsF0ou5LE9FZegwRUPR9wdoakjdYy1GYD8
	 3qU2vMsXJEzIoldM8WhjOy9YBYIwbnExPxRUlZ/rW9NI/H07cU4Kp8OoaeM0EAhHWO
	 RE+xxMLGOhqLQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4EC71488E6;
	Tue, 10 Nov 2026 07:16:58 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH 0/2] ASoC: rockchip: i2s-tdm: register the PCM before the
 DAI
Date: Tue, 10 Nov 2026 07:16:57 +0000
Message-Id: <20261110-asoc-rockchip-i2s-tdm-v1-0-f32951b3c527@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMAxA0asgz7WEM0TAVaoOqWPAVCUoBoSEu
 HvTdnzD/yeYZBWDrjohy66maS6gWwU8hnkQ1FgMrnaeiGoMlhhz4hePuqA6wzW+Mfrg+8ZLQ6G
 F0i5Zej1+3/vjb9uek/D6ncF1fQCxBFb3eQAAAA==
X-Change-ID: 20261110-asoc-rockchip-i2s-tdm-d6a6f86e81a9
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295018; l=2133;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=fwtymsovofR1O3F9W5rqYLeo/TK8Hr6MiEo7/hJuKEE=;
 b=Eoei1XstvuoctnMT5F4uX9OmuONHsAC3pwbJT55sfLRkBX/FP2npyYSgUi8pCG8GBa5ap4vSV
 tX2RMrltZWSAXGsWglSG6yXbav1QNF1YAW3u9vbBLrHe9ogyuLn3o5+
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Rockchip I2S-TDM driver registers its DAI component before the
dmaengine PCM component. A sound card that was registered earlier and
waits for the CPU DAI is bound by snd_soc_component_register() as soon
as the DAI component appears, which also satisfies the DAI link's
platform (it defaults to the CPU of_node), so the card binds without the
PCM component. Every open of the PCM then fails with -EINVAL from
snd_pcm_hw_constraints_complete(), silently. On RK3588 this happens to
the HDMI sound card whenever the HDMI codec probes before the I2S
controller. Patch 1 registers the PCM first, as rockchip_spdif already
does.

Patch 2 adds the missing regmap default for I2S_XFER, which otherwise
warns "using zero-initialized flat cache" on its first cached access.

The non-TDM rockchip_i2s driver has the same registration order; the
same change for it will follow once it is tested on a board that uses
that controller (the RK3588 board here only has I2S-TDM instances).

Tested on an Orange Pi 5 (RK3588S): with patch 1 the HDMI card has its
dma:fddf0000.i2s component (debugfs asoc/hdmi0), speaker-test on
plughw:CARD=hdmi0 plays, and "aplay -D hw:<hdmi>,0" no longer fails
with "Invalid argument" (traced before the fix to
snd_pcm_hw_constraint_mask returning -22 with no dmaengine component on
the runtime). With patch 2 the flat-cache warning for fddf0000.i2s is
gone and HDMI playback is unchanged.

This series was developed with Claude (Anthropic) as a coding assistant:
it wrote the code and the commit messages, and I reviewed and tested
every change as described above.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Arun Iyengar (2):
      ASoC: rockchip: i2s-tdm: Register the PCM before the DAI
      ASoC: rockchip: i2s-tdm: add the reset value of XFER to the regmap defaults

 sound/soc/rockchip/rockchip_i2s_tdm.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)
---
base-commit: cde5523c75f1320a55ac1d55a717ccbb566557f0
change-id: 20261110-asoc-rockchip-i2s-tdm-d6a6f86e81a9

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



