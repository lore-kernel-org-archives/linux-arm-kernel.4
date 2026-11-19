Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D775F60A2638
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SXLLchIS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qICFo0gV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RmXsAjAcTfcq6c7xsvavkfoeRMZk5EmBWQcvZmkAZtY=; b=SXLLchISZAaiaT78WnCao0DmRH
	iwvr7Ox2wnVvChWcQ3WFubNHtgYsI/bM95CY2lTlQXi4LKadUVb1n7bfmD1vi0oCi0xQ5T+mQbQyJ
	fRo1IQcEx00RsvmkU3ZCAfhHkRveCD4upjn5JPSvbk58hqInrGCCQSaNPXvrfFuU+lMUcDipekynU
	c8ShAs07UQVYtznqT89JY6XWFky4X6/nzH9BtOAceIPdLBhAbIfnctkBxwnMNaPl4PeFAz0GjqIIM
	tbTrkeDkW177w0in5omHG/Qe1rIARNoVUldcvj9ZTlFsgfTQ+AQR0I+IX4VZkaWJYnK7xHOr3gYh2
	eu5wueYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6TW-0000000Cw2O-3asr;
	Thu, 19 Nov 2026 18:03:10 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6TT-0000000Cw11-2Yel
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:03:09 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-70b875f6f13so19454eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111386; x=1795716186; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RmXsAjAcTfcq6c7xsvavkfoeRMZk5EmBWQcvZmkAZtY=;
        b=qICFo0gV/gYoMNbtwErFYz3DsrHuQTFXZoz+w6w8ROZi9Y77HBhMOqlOy0v7+qwTI6
         APyRXizfqWPQ0yyHK4sDzdaqT2tjxIC+Fneiot9dOLiaDVvxmn7Z/YAm5kv/hSzpcr9c
         AsbO/4O+hDLuJc/jga1jyfeErLNOCMZAXHng7VXwAzxBH9ct7X6wPAfSRHdYjpQ3jgDm
         52d/a8iUsGSNLzi/N3KQ+TquvK17zF73OEveS+CPCkVWoeO1qeJHy2MHpr8ETPj7e/F1
         XZMG7/ifxJOH8Yk4DoJuFT7I4oAP75Dgsjh4rNHUolhVPQ9d7h5/ab0aXnL6N6NQ7zZT
         0AqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111386; x=1795716186;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RmXsAjAcTfcq6c7xsvavkfoeRMZk5EmBWQcvZmkAZtY=;
        b=r9ccwwrJHVvE7pVQ6UnxXEwyRVOcYRbccjNPqmCksigLwdLUyRE8OSbsro2gj65Sn7
         pQRReo59flUvzHUqTj/4Ee/XSy1z5tdytIaac3+m6Md+7b6TWCRfkguHWJiC5VmsYxIj
         K/fb9q0Q4MTs0a3JWFkhguzMDq8HK4qlFqbK2x99nrnh7/6dIZTMs4OsP2fIETfsZyvC
         dVYP21ZyAx1qwKn0/uJuzSoCAX0QFZ22tpUBIoVhuW3qp9aCWXSxGyM4rOagLZQvqmSU
         G8uUnP8FP35+BjnyHa+fVLkRfKEBcD4y274U/G4yTiBI+mM0Y1zMpBwQhR1nwEvQhSFq
         Yn1w==
X-Forwarded-Encrypted: i=1; AL+hErFfbe633XJ+Tnib2L9zJUVOZqWlj5OxHkHVszv3eNWg8SBFC2qPca1iL44pY/Nl2NvQLUcQ94m0z7oB/prayJK1@lists.infradead.org
X-Gm-Message-State: APuU4Z8ykrAsuXIhngJE9bnPXsYM6XYwWzrWgn0KY5BolSHh2QMRmbaQ
	a08e8jQxroJifvmG0eUPuYv7DRZl2Sxj9wu+k70gzL1ERz1W1dUBZYpU
X-Gm-Gg: AYBFou017sJXMrMvGG9XK4x1M1HnF8Li+lV22XjTgQUZgfkUph1jWsGCSpne5gjjJUO
	JrpVzF4bCqpa3++NvrD/v+vF0h9kLfhvYcZlN1vnYMn0jiCdUMgSnUnPEwZk/fOid0SBsZKh6Hv
	iExC6AJ8Ru0B7rB1N/O3QHWfnw1CZnPsS0CfXhwVj8fJfngYQLEtnc+qg4IEGpQUKhSYPPbRahT
	uxENpC0dg5SspUNF/l4sIYSBqiC6ZszY/AvbdBTKjJVHAa6UpTTa42d3VBkYGH67eRTfws8ahqu
	9pzukyVafv763tZlUlKwdbYIgXTphH7KxMg6cHCiQVzd9R6Yf9aRQSS3B8DQIdZYgcnmXj+0Xra
	TkYO7z2sbWmwrrllZXw6igpX6egraMrgN7pbQf2m0MmvSqAv3WfCnU0Y1i+dvUCWgddAe6yt6tQ
	cz2bbq7Accqj4CRGkBZVFYBKHsDxvDzNWRgBTrqA+qV5SEliI2DF6Dnac4FHJcAUnIXVVB8Vqgd
	3PpOoQf66VBrIudPxhiHLuI3rYuFfF9QKGEvpCuvPjal9gkieLRooOL6lC/GYIhSRy6bUJhnAX+
	4bGBHVzw/IN/gr5y80dbGWbg6aGTs3XmWN5G6U4cdqJEVg96D73AcK65PUaKpqm5I3k7bcbZfd1
	yF+DbdfH92StLTTDafiMx3r7Sg52osSlNSDz+MKWFwpijBOeFmXJPlb6E9916NRuSxL+tEhdL1p
	YivuxIn4L/9NHg/mPTJQ55PROQb76R0aIV8MO2xspq+SAoCCvW1p0Ql2JGmjr5NbWVxnCwXVFtx
	w==
X-Received: by 2002:a05:6820:f006:b0:70d:a53e:845 with SMTP id 006d021491bc7-71b394d5f20mr371062eaf.17.1795111386435;
        Thu, 19 Nov 2026 10:03:06 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b3806ef20sm448478eaf.7.2026.11.19.10.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:03:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 0/3] dmaengine: sun4i: retain cyclic descriptors until
 callbacks drain
Date: Thu, 19 Nov 2026 11:02:20 -0700
Message-Id: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-0-3935aef58db9@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQ6CMBBFr2K6dkxboKAr72FctKWFUQqGYqMh3
 N0WNyw1meTnJz/vzUy8GdF4ctrNZDQBPQ59LNl+R3Qr+8YA1rETTrlgjGbgn8rhFKPPEWonQcu
 uU1LfoUNrJnQGAgMl2JFTQVUpLImsx2gsvlbP5frtEXQzekrwtGjRT8P4Xh8JLO3+dcZjkOtCU
 lFkjOb23DiJ3UEPjiRn4BsqK36lcqBgVVnzoiopt9WWuizLB8ex879CAQAA
X-Change-ID: 20261103-submit-sun4i-dma-callback-lifetime-v1-b6192060b76f
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_100307_661878_71CCC7C3 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Retain descriptors through callback synchronization using a shared virt-dma
termination helper, then use it to fix sun4i cyclic callback lifetime
and IRQ serialization. The helper keeps termination usable in atomic
context while callbacks finish in process-context synchronization.

Also serialize pending IRQ handling with physical-channel reuse so an
old transfer's interrupt state cannot complete its replacement or disable
the replacement's interrupts.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v3:
- Leave prepared descriptors with the client during termination so they
  can still be submitted after synchronization, following Frank's review:
  https://lore.kernel.org/r/av8mu_ZFxNKSgFTK@SMW015318/
- Link to v2: https://patch.msgid.link/20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com

Changes in v2:
- Add a shared virt-dma descriptor-retirement helper before the sun4i
  fix, following Frank's review.
- Retain all collected descriptors until synchronization, avoiding
  provider-specific cyclic checks and preserving repeated termination.
- Retire pending IRQ state before physical-channel reuse and acknowledge
  events under the owning virtual channel's lock in a separate fix.
- Link to v1: https://patch.msgid.link/20261103-submit-sun4i-dma-callback-lifetime-v1-v1-1-4c5a0653104f@gmail.com

---
James Hilliard (3):
      dmaengine: virt-dma: share deferred descriptor retirement
      dmaengine: sun4i: retain cyclic descriptors until callbacks drain
      dmaengine: sun4i: retire interrupt state before channel reuse

 drivers/dma/sun4i-dma.c | 68 +++++++++++++++++++++++++++++--------------------
 drivers/dma/virt-dma.h  | 21 ++++++++++++++-
 2 files changed, 60 insertions(+), 29 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git fixes
change-id: 20261103-submit-sun4i-dma-callback-lifetime-v1-b6192060b76f

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


