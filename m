Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D952606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 12:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PnymXEYi;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=USHOwMrc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QyX/bokU0mEshftPogmAYinbZSTYIiyRguYJfdW7HHU=; b=PnymXEYiPvFO53xq7hRACmvUFO
	81yD9xiY/Ior/p5i5bDVbtA4+42wGPOqwtQTDtSgpyTGd3QGvIQrKPH7LpMbM/s/wp1Z2IN4Mu3bB
	GF7KOsKZaehzAYBc/PunxWZ8dihiesb+e/q+PcWF6eoDzk25DM6IebpIX8me1FaHLRoht1IrfVjNB
	nQ0hVOnYnxIyFqAwm3RmBf3irkjZjt2l2CBB3kRuuO+Gicn04xNU4u+WQIeLjFDM08ZjBRzQCbi+V
	35vlyXsWHxH58nH/UyN0sWNwgnnyfWoEmxxA/i43Y8ZGYvivgRbD9iHutLcei6Wa7UE68FYHieAuq
	WEmksUkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknI-00000003mw7-2xp6;
	Tue, 10 Nov 2026 12:17:44 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQknG-00000003muA-0lzg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 12:17:43 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a20e41008cso13363775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 04:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313059; x=1794917859; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QyX/bokU0mEshftPogmAYinbZSTYIiyRguYJfdW7HHU=;
        b=USHOwMrcQZtvCSDdD3SGYXV1k582WiYxW227nlJd7iXxhTE/sXLSiMg4gPTPCkk5+T
         u3mCFRvYMT/kHHIBqCepVZMhzMqXY3FwK0lRtIkpqkMAN30WJEvW0Gm02tH95H65oP/O
         0BTKbjl5ynV1eHFigic1t2rQdLlO6TrZiA4IshO/rdLKipJxvy0Lx6dQaLKqQaxY62Ms
         ozXCl/l93dlI/bbUElHOYYjH+FK3YNNRelDWDf+6YCIho5Owhe0dCdxHCdKkUKrBnbRd
         kVHr9D0b6j+7KjU8KrlJlC/JbfoAaPueKHuYs/i2KMnKtwAHEx6PJkwzSZSRq1GC43Dd
         qPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313059; x=1794917859;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QyX/bokU0mEshftPogmAYinbZSTYIiyRguYJfdW7HHU=;
        b=aM5ecEGBkEpEheofWwbYlFFt1GoSeHNEwwWOkQ1dhH798rzVv8krN3JewNTmUXjTSK
         0RU2oMPkz4gBC420fY77zdOmjXP+he2wbegdfPiUPaBe6NqgnLqFv7vRB1EJThtIje0l
         7MoE73Jk60IfQygUV6borfmpImwQSrqs+YypoimXwNvlrmsnAn4G6YIRLrSbQTaZ/3p4
         tx2b3peOgAeM2tKOFWRQ7OcimG6qUpAyh11TzgpW/NPsMYx8gN09+czPVzPJ305D0u+Z
         hYgOrMEIJS6z1G1U6/irgmVvOfJOZdrENSzaWROZvT2N6g5y/1vxg/hkqo78LZ4Bo47V
         vwzQ==
X-Gm-Message-State: APuU4Z/+NrgneH9zmxzVQMq/TKKX59KTuS7F1Ctc1G0axQkuTo91SY6l
	xtxrOZPPonS2WAOZ5Xv2KlHIGNfS5z0Re/luVfo2nSqlceITc4GTjyqgHWIFD6+PREgO1UxiBA=
	=
X-Received: from wmcq4.prod.google.com ([2002:a05:600c:c104:b0:4b8:b187:f0cd])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4584:b0:4a2:c2b:a91b
 with SMTP id 5b1f17b1804b1-4ba0233bd35mr40801345e9.10.1794313058867; Tue, 10
 Nov 2026 04:17:38 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:32 +0100
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110121731.2728824-12-ardb+git@google.com>
Subject: [PATCH v2 00/10] efi: Expose loaded image properties via info struct
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_041742_277862_9462F44C 
X-CRM114-Status: GOOD (  15.42  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

Clean up the arm64 build script and linker hacks that zboot uses to
obtain properties of the loaded image (which it cannot access directly
via a relative reference like the ordinary EFI stub).

Instead, define a generic struct efi_image_info, and expose its offset
in the loaded image in a similar manner, but without relying on explicit
linker script exports.

Populate the struct with section markers that all architecture use for
loading the kernel image at boot, so that all the linker exports can be
dropped for them.

Changes since v1:
- drop arm64 image header changes
- move efi_image_info out of __efistub_ scope so it can access vmlinux
  symbols directly
- implement in a generic manner for all architectures that support zboot
- address Sashiko comments

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev
Cc: linux-riscv@lists.infradead.org
Link: https://lore.kernel.org/all/0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com/

Ard Biesheuvel (10):
  efi/zboot: arm64: Add missing barrier after cache maintenance
  efi/riscv: Rename __init_text_end to __inittext_end like other archs
  efi/libstub: Avoid _end section marker in library code
  efi/libstub: Capture loaded image information in struct efi_image_info
  efi/libstub: arm64: Use struct efi_image_info to access image
    properties
  efi/libstub: loongarch: Use struct efi_image_info to access image
    properties
  efi/libstub: riscv: Use struct efi_image_info to access image
    properties
  efi/libstub: Make efi_remap_image() return efi_status_t
  efi/zboot: Disentangle efi_remap_image() from efi_cache_sync_image()
  efi/libstub: arm64: Drop zboot code_size hack

 arch/arm64/boot/Makefile                             |  3 --
 arch/arm64/kernel/efi-header.S                       |  2 +
 arch/arm64/kernel/image-vars.h                       | 10 ----
 arch/loongarch/kernel/head.S                         |  1 +
 arch/loongarch/kernel/image-vars.h                   |  1 -
 arch/riscv/include/asm/sections.h                    |  2 +-
 arch/riscv/kernel/head.S                             |  1 +
 arch/riscv/kernel/image-vars.h                       |  5 --
 arch/riscv/kernel/vmlinux.lds.S                      |  4 +-
 drivers/firmware/efi/libstub/Makefile                |  1 +
 drivers/firmware/efi/libstub/Makefile.zboot          | 11 ++++-
 drivers/firmware/efi/libstub/arm32-stub.c            |  3 ++
 drivers/firmware/efi/libstub/arm64-stub.c            | 20 ++++----
 drivers/firmware/efi/libstub/arm64.c                 |  8 ++--
 drivers/firmware/efi/libstub/efi-stub-entry.c        | 10 +++-
 drivers/firmware/efi/libstub/efi-stub-helper.c       | 15 ++++--
 drivers/firmware/efi/libstub/efi-stub.c              |  3 +-
 drivers/firmware/efi/libstub/efistub.h               | 48 ++++++++++++++++++--
 drivers/firmware/efi/libstub/image_info.S            | 12 +++++
 drivers/firmware/efi/libstub/kaslr.c                 |  2 +-
 drivers/firmware/efi/libstub/loongarch-stub.c        |  4 +-
 drivers/firmware/efi/libstub/riscv-stub.c            | 14 +++---
 drivers/firmware/efi/libstub/zboot-decompress-gzip.c |  2 -
 drivers/firmware/efi/libstub/zboot-decompress-zstd.c |  2 -
 drivers/firmware/efi/libstub/zboot.c                 | 29 +++++++++++-
 drivers/firmware/efi/libstub/zboot.lds               |  6 +--
 26 files changed, 150 insertions(+), 69 deletions(-)
 create mode 100644 drivers/firmware/efi/libstub/image_info.S


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.542.g3ef89b7020-goog


